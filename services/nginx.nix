{ config, ... }: 

let
  email = config.email;
in
{
  services.nginx = {
    enable = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults = {
      email = email;
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ]; 
}