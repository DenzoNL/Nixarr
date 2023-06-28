{ config, ... }:

let
  domain = config.domain;
in
{
  services.sonarr = {
    enable = true;
  };

  services.nginx.virtualHosts."sonarr.${domain}" = {
    forceSSL = true;
    enableACME = true;
    http2 = true;
    locations."/" = {
      proxyPass = "http://localhost:8989/";
    };
  };
}