{ config, ... }:

let
  domain = config.domain;
in
{
  services.radarr = {
    enable = true;
  };

  services.nginx.virtualHosts."radarr.${domain}" = {
    forceSSL = true;
    enableACME = true;
    http2 = true;
    locations."/" = {
      proxyPass = "http://localhost:7878/";
    };
  };
}