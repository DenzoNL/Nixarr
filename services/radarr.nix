{ config, ... }:

{
  config = { 
    services.radarr = {
      enable = true;
    };

    services.nginx.virtualHosts."radarr.${config.services.nixarr.domain}" = {
      forceSSL = true;
      enableACME = true;
      http2 = true;
      locations."/" = {
        proxyPass = "http://localhost:7878/";
      };
    };
  };
}