{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history.path = "${config.xdg.stateHome}/zsh/history";
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "ls --color=auto";
    };
    localVariables = {
      PS1 = "%F{blue}%~%f $ ";
    };
    initExtra = builtins.concatStringsSep "\n" [
      "unsetopt BEEP"
      "zle_highlight=('paste:none')"
      "zstyle ':completion:*' menu select"
      "_comp_options+=(globdots)"
      ""
    ];
  };
}

