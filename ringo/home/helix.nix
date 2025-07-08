{
  enable = true;
  languages.language-server = {
    golangci-lint-langserver = {
      command = "golangci-lint-langserver";
      args = ["run" "--output.json.path" "stdout" "--show-stats=false" "--issues-exit-code=0"];
    };
  };
  languages.language = [
    {
      name = "typescript";
      file-types = ["ts" "tsx"];
      auto-format = true;
      formatter = {
        command = "pnpm";
        args = ["exec" "prettier --parser" "typescript"];
      };
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
      name = "tsx";
      auto-format = true;
      formatter = {
        command = "pnpm";
        args = ["exec" "prettier --parser" "typescript"];
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
  ];
  settings = {
    theme = "ao";
    editor = {
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
