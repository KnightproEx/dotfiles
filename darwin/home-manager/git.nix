{ config, ... }:

{
  programs.git = {
    enable = true;

    includes = [
      { path = config.sops.templates."git".path; }
    ];

    signing = {
      format = "ssh";
      signByDefault = true;
    };

    aliases = {
      co = "commit";
      ca = "commit -a";
      cm = "commit -m";
      cam = "commit -am";
      cme = "commit --amend";
      came = "commit -a --amend";
      cmn = "commit --amend --no-edit";
      camn = "commit -a --amend --no-edit";

      pb = "pull --rebase";

      ph = "push";
      pf = "push --force-with-lease";

      st = "status -sb";

      df = "diff --output-indicator-new=' ' --output-indicator-old=' '";

      ap = "add -p";
      lg = "log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'";
      lgg = "log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit";

      rb = "rebase";
      rba = "rebase --abort";
      rbc = "rebase --continue";
      rbi = "rebase --interactive";
      rbs = "rebase --skip";

      mg = "merge";
      mga = "merge --abort";
      mgc = "merge --continue";

      cp = "cherry-pick";
      cpa = "cherry-pick --abort";
      cpc = "cherry-pick --continue";
    };

    extraConfig = {
      url = {
        "git@github.com" = {
          insteadOf = "gh";
        };
      };

      core = {
        editor = "nvim";
        compression = 9;
        whitespace = "error";
        preloadingindex = true;
      };

      advice = {
        addEmptyPathspec = true;
        pushNonFastForward = true;
        statusHints = true;
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      diff = {
        context = 3;
        renames = "copies";
        interHunkContent = 10;
      };

      pager = {
        diff = "diff-so-fancy | $PAGER";
        branch = false;
        tag = false;
      };

      diff-so-fancy = {
        makeEmptyLines = false;
      };

      interactive = {
        diffFilter = "diff-so-fancy --patch";
        singleKey = true;
      };

      push = {
        autoSetupRemove = true;
        default = "current";
        followTags = true;
      };

      pull = {
        default = "current";
        rebase = true;
      };

      rebase = {
        autoStash = true;
        missingCommitsCheck = "warn";
      };

      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,greed,red";
      };

      branch = {
        sort = "-committerdate";
      };

      tag = {
        tag = "-taggerdate";
      };

      color = {
        diff = {
          meta = "black bold";
          frag = "magenta";
          context = "white";
          whitespace = "yellow reverse";
          old = "red";
        };
        decorate = {
          HEAD = "red";
          branch = "blue";
          tag = "yellow";
          remoteBranch = "magenta";
        };
        branch = {
          current = "magenta";
          local = "default";
          remote = "yellow";
          upstream = "green";
          plain = "blue";
        };
      };
    };
  };
}
