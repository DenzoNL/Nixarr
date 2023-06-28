{ config, ... }: 

{
  services.nginx = {
    enable = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults = {
      email = config.email;
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ]; 
}