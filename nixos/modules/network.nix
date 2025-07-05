{ ... }:
{

  networking.hostName = "thinkpad";
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    51413
    22

  ];

  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1714;
      to = 1764;
    } # KDE Connect
  ];

  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1714;
      to = 1764;
    } # KDE Connect
  ];
  networking.firewall.allowedUDPPorts = [ 51413 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # for ethernet
  # networking.useDHCP = true;

  # # or if using interfaces directly:
  # networking.interfaces.enp0s31f6.useDHCP = true;
}
