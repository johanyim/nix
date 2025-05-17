{
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
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

    # transmission # this causes transmission-gtk to break
    # because it uses the same port to listen for peers
    transmission-gtk
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim -c 'Man!' -";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "thinkpad";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  fonts = {
    packages = with pkgs; [
      # nerd-fonts.noto-fonts
      # nerd-fonts.droid-sans-mono
      nerdfonts
      noto-fonts
      departure-mono
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Noto Sans Mono" ];
      };
    };
  };

  users.users.johan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Johan Yim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];

    packages = with pkgs; [
      fastfetch
      # nerd-fonts.noto
      nerdfonts
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

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 51413 ];
  networking.firewall.allowedUDPPorts = [ 51413 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # for ethernet
  # networking.useDHCP = true;

  # # or if using interfaces directly:
  # networking.interfaces.enp0s31f6.useDHCP = true;

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

}
