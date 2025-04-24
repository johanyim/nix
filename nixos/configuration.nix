{ config, pkgs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/bundle.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  # services.seatd.enable = true;
  # services.dbus.enable = true;

  services.printing.enable = true;

  security.rtkit.enable = true;

  fonts = {

    packages = with pkgs; [
      nerdfonts
      noto-fonts
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
    ];

    packages = with pkgs; [
      fastfetch
      nerdfonts
    ];
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    hyprland
    firefox
    git
    vim
    waybar

    mako
    libnotify

    hyprpaper
    # mpvpaper

    pulseaudio
    brightnessctl

    rofi-wayland

    home-manager

    rustup

  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
