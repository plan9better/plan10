let carapace_completer = { |spans|
    carapace $spans.0 nushell ...$spans | from json
}
$env.config = {
    show_banner: true,
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
        external: {
               enable: true
               max_results: 100
               completer: $carapace_completer
        }
    }
}
$env.PATH = (
    $env.PATH |
    split row (char esep) |
    prepend /home/patrykwojnarowski/.apps |
    append /usr/bin/env
)

$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

def putm [] {
    ping-sweep 192.168.10.20 1 5
}

# Pings all ip's in range once
def ping-sweep [prefix: string, start: int, end: int] {
  let total = ($end - $start + 1)
  mut results = []

  for ip in $start..$end {
    let host = $"($prefix)($ip)"
    print $host
    let received = (ping $host -c 1 -t 1 | lines
        | where $it =~ "1 packets transmitted"
        | parse "1 packets transmitted, {received} packets received, {_} packet loss"
        | get received
        | first
        | into int
    )
    $results = ($results | append {host: $host, received: $received})
  }
  let success = ($results | where received > 0 | length)
  let percentage = ($success * 100 / $total)

  print $"($success)/($total) hosts up: ($percentage)%"

  print "Down hosts:"
  $results
  | where received == 0
  | get host
}

