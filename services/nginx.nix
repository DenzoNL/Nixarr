{ config, ... }: 

{
  config = {
    services.nginx = {
      enable = true;
    };

    security.acme = {
      acceptTerms = true;
      defaults = {
        email = config.nixarr.email;
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}