{ config, ... }:

{
  config = { 
    services.radarr = {
      enable = true;
    };

    services.nginx.virtualHosts."radarr.${config.nixarr.domain}" = {
      forceSSL = true;
      enableACME = true;
      http2 = true;
      locations."/" = {
        proxyPass = "http://localhost:7878/";
      };
    };
  };
}