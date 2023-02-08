{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "22.11";

  home.username = "ruben";
  home.homeDirectory = "/home/ruben";

  imports = [
    ./config/zsh.nix
    ./config/nvim.nix
    ./config/git.nix
  ];

  home.packages = [
    pkgs.stow
    pkgs.gcc
    pkgs.ghc
    pkgs.guile_3_0
    pkgs.rlwrap
    pkgs.ripgrep
  ];

  xdg = {
    enable = true;
    configHome = ~/.config;
    cacheHome = ~/.cache;
    dataHome = ~/.local/share;
    stateHome = ~/.local/state;
  };

  home.file.".guile".source = ./dots/guile.scm;

  home.sessionVariables = {
    HISTFILE = "${config.xdg.stateHome}/bash/history";
    GUILE_HISTORY = "${config.xdg.stateHome}/guile/history";
  };
}
