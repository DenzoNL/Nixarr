{ config, ... }:

{
  services.lidarr = {
    enable = true;
  };

  services.nginx.virtualHosts."lidarr.${config.domain}" = {
    forceSSL = true;
    enableACME = true;
    http2 = true;
    locations."/" = {
      proxyPass = "http://localhost:8686/";
    };
  };
}