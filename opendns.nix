{ config, ... }:

{
  networking.networkmanager.insertNameservers = [
    "208.67.222.222" 
    "208.67.220.220"
  ];
  networking.resolvconf.enable = false;

  services.resolved.enable = false;
  services.ddclient = {
    enable = true;
    configFile = "/etc/ddclient_opendns.conf";
  };

}