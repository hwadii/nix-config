{ options, config, lib, pkgs, ... }:
{
  imports = [];

  options = {
      wadii.home = lib.mkOption {
        type = options.home-manager.users.type.functor.wrapped;
      };
  };

  config = {
    wadii.home = {
      programs.home-manager.enable = true;

      home.packages = with pkgs; [
        pb_cli
        pfetch
        pass-wayland
        ripgrep
      ];

      home.stateVersion = "20.09";
    };
  };
}
