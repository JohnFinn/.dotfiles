{
  pkgs,
  config,
  ...
}: {
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  services.xserver = {
    enable = true;

    xkb = {
      layout = "de";
      variant = "nodeadkeys";
    };

    videoDrivers = ["nvidia"];

    displayManager.gdm = {
      enable = true;
      wayland = false;
    };

    desktopManager.gnome.enable = true;
  };

  services.libinput = {
    enable = true;

    # disabling mouse acceleration
    mouse = {
      accelProfile = "flat";
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-console

    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ];

  services.udev.packages = with pkgs; [gnome-settings-daemon];
  environment.systemPackages = with pkgs; [gnomeExtensions.appindicator];
}
