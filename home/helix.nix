{pkgs, helix-plugins, ...}: {
  enable = true;
  # to build this helix version you need macos???
  package = if pkgs.stdenv.isDarwin then helix-plugins.packages."aarch64-darwin".default else pkgs.helix;
  languages.language-server = {
    golangci-lint-langserver = {
      command = "golangci-lint-langserver";
      args = ["run" "--output.json.path" "stdout" "--show-stats=false" "--issues-exit-code=0"];
    };
  };
  languages.language = [
    {
      name = "javascript";
      file-types = ["ts" "tsx" "js" "jsx"];
      auto-format = true;
      formatter = {
        command = "bunx";
        args = ["prettier"];
      };
      # required-root-patterns = ["bun.lock" "tsconfig.json"];
    }
    {
      name = "clickhouse-sql";
      file-types = ["chsql"];
      scope = "source.clickhouse-sql";
      language-servers = ["clickhouse-sql-lsp"];
    }
    {
      name = "json";
      file-types = ["json"];
      auto-format = true;
      formatter = {
        command = "jsonfmt";
        args = [];
      };
    }
    {
      name = "nix";
      auto-format = true;
      formatter = {
        command = "alejandra";
      };
    }
    {
      name = "idris";
      file-types = ["idr"];
    }
    {
      name = "rust";
      file-types = ["rs"];
      auto-format = true;
      formatter = {
        command = "rustfmt";
        args = [];
      };
    }
    {
      name = "go";
      file-types = ["go"];
      auto-format = true;
      language-servers = ["gopls" "golangci-lint-langserver"];
      formatter = {
        command = "gofmt";
        args = ["-s"];
      };
    }
    {
      name = "yaml";
      file-types = ["yaml"];
      auto-format = true;
      formatter = {
        command = "yamlfmt";
        args = ["-in"];
      };
    }
    {
      name = "c";
      file-types = ["c" "cpp" "h" "hpp"];
      auto-format = true;
      formatter = {
        command = "clang-format";
        args = [];
      };
    }
  ];
  settings = {
    theme = "ayu_dark";
    editor = {
      line-number = "relative";
      smart-tab = {
        enable = false;
      };
      whitespace = {
        render = {
          space = "all";
          tab = "all";
        };
        characters = {
          space = "·";
          tab = "→";
        };
      };
    };
  };
}
