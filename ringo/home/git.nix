{lib, ...}: {
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.gh = {
    enable = true;
  };

  programs.git = {
    enable = true;

    userName = "plan9better";
    userEmail = "plan9better@proton.me";

    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
    };

    signing = {
      key = "63BC493CAAD72DCD";
      signByDefault = true;
    };

    aliases = {
      b = "branch";
      c = "checkout";
      s = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      ca = "commit -am";
      dc = "diff --cached";
      amend = "commit --amend -m";
      nuke = "reset --hard origin/master";

      update = "submodule update --init --recursive";
      foreach = "submodule foreach";
    };
  };
}
