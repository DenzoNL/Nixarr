{
  description = "Nixarr";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    nixosModules.nixarr = { config, ... }: {
      imports = [
        { 
          services.sonarr = import ./services/sonarr.nix { inherit (config) domain; };
          services.radarr = import ./services/radarr.nix { inherit (config) domain; };
          services.lidarr = import ./services/lidarr.nix { inherit (config) domain; };
          services.nginx = import ./services/nginx.nix { inherit (config) email; };
        }
      ];
    };
  };
}
