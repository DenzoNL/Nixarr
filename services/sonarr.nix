{ config, ... }:

{
  services.sonarr = {
    enable = true;
  };

  services.nginx.virtualHosts."sonarr.${config.domain}" = {
    forceSSL = true;
    enableACME = true;
    http2 = true;
    locations."/" = {
      proxyPass = "http://localhost:8989/";
    };
  };
}