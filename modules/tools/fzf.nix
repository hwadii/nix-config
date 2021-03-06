{ config, lib, pkgs, ... }:
{
  wadii.home = {
    programs.fzf = rec {
      enable = true;
      defaultCommand = "${pkgs.fd}/bin/fd --type f --follow --hidden -E'.git'";
      defaultOptions = [
        "--height 40%"
        "--bind 'tab:down' --bind 'btab:up' --bind 'ctrl-s:toggle'"
        "--bind 'alt-a:select-all'"
        "--color=16,hl:#ffcb6b,hl+:#89ddff,fg+:7,pointer:#89ddff"
      ];
      fileWidgetCommand = defaultCommand;
      fileWidgetOptions = [ "--select-1" "--exit-0" "--preview 'head {}'" ];
      changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d --hidden --follow --exclude '.git' --exclude 'node_modules'";
      changeDirWidgetOptions = [ "--preview '${pkgs.tre-command}/bin/tre {} | head -200'" ];
      tmux.enableShellIntegration = false;
      enableZshIntegration = true;
    };
  };
}
