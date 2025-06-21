{
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
    ./env.nix
  ];

  environment.systemPackages = with pkgs; [
    # hyprland
    git
    gcc
    clang

    libnotify
    pulseaudio
    brightnessctl

    home-manager

    # rustup
    # cargo

    zoxide
    eza
    ripgrep

    wl-clipboard

    killall

    hwinfo

    # transmission # this causes transmission-gtk to break
    # because it uses the same port to listen for peers
    transmission-gtk

  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # Full path to Hyprland
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "johan";
      };
    };
  };

  services.upower = {
    enable = true;
    percentageLow = 20;
    percentageCritical = 5;
    criticalPowerAction = "Hibernate";
  };

  # services.seatd.enable = true;
  # services.dbus.enable = true;

  services.printing.enable = true;

  security.rtkit.enable = true;

  users.users.johan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Johan Yim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "lp" # for bluetooth
    ];

    packages = with pkgs; [
      fastfetch
      # nerd-fonts.noto
      # nerdfonts
      noto-fonts
      # nerd-fonts.droid-sans-mono
    ];
  };

  programs.zsh.enable = true;

  # programs.hyprland.enable = true;

  # nixpkgs.config.allowUnfree = true;

  # services.transmission = {
  #   enable = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [
    "root"
    "johan"
  ];

}
