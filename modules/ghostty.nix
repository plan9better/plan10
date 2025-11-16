{pkgs, ...}: let
  inherit (pkgs.stdenv) isDarwin;
  inherit (pkgs.lib.attrsets) mapAttrsToList;
  package =
    if isDarwin
    then null
    else pkgs.ghostty;
in {
  programs.ghostty = {
    enable = true;

    # Don't actually install Ghostty if we are on Darwin.
    # For some reason it is marked as broken.
    package = package;

    # Can't install things from null.
    installBatSyntax = !isDarwin;

    clearDefaultKeybinds = true;

    settings = {
      font-family = "Berkeley Mono";
      font-family-bold = "BerkeleyMono-Bold";
      font-family-italic = "BerkeleyMono-Bold";

      theme = "ayu";

      # 100 MiB
      scrollback-limit = 100 * 1024 * 1024;

      mouse-hide-while-typing = true;

      confirm-close-surface = false;
      quit-after-last-window-closed = true;

      window-decoration = isDarwin;
      macos-titlebar-style = "tabs";

      macos-option-as-alt = "left";

      # config-file = toString <| pkgs.writeText "base16-config" ghosttyConfig;

      command = "${pkgs.nushell}/bin/nu";
      keybind =
        mapAttrsToList (name: value: "ctrl+shift+${name}=${value}") {
          c = "copy_to_clipboard";
          v = "paste_from_clipboard";

          z = "jump_to_prompt:-2";
          x = "jump_to_prompt:2";

          h = "write_scrollback_file:paste";
          i = "inspector:toggle";

          page_down = "scroll_page_fractional:0.33";
          down = "scroll_page_lines:1";
          j = "scroll_page_lines:1";

          page_up = "scroll_page_fractional:-0.33";
          up = "scroll_page_lines:-1";
          k = "scroll_page_lines:-1";

          home = "scroll_to_top";
          end = "scroll_to_bottom";

          enter = "reset_font_size";
          plus = "increase_font_size:1";
          minus = "decrease_font_size:1";

          t = "new_tab";
          q = "close_surface";

          "one" = "goto_tab:1";
          "two" = "goto_tab:2";
          "three" = "goto_tab:3";
          "four" = "goto_tab:4";
          "five" = "goto_tab:5";
          "six" = "goto_tab:6";
          "seven" = "goto_tab:7";
          "eight" = "goto_tab:8";
          "nine" = "goto_tab:9";
          "zero" = "goto_tab:10";
        }
        ++ mapAttrsToList (name: value: "ctrl+${name}=${value}") {
          "tab" = "next_tab";
          "shift+tab" = "previous_tab";
        }
        ++ mapAttrsToList (name: value: "super+${name}=${value}") {
          h = "new_split left";
          j = "split-down";
          k = "split-up";
          l = "split-right";
        }
        ++ mapAttrsToList (name: value: "super+${name}=${value}") {
          h = "split-focus-left";
          j = "split-focus-down";
          k = "split-focus-up";
          l = "split-focus-right";
        };
    };
  };
}
