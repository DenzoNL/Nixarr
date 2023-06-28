{
  description = "Nixarr";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    nixosModules.nixarr = { config, ... }: {
      imports = [
        ./common.nix
        ./services/sonarr.nix
        ./services/radarr.nix
        ./services/lidarr.nix
        ./services/nginx.nix
      ];
    };
  };
}
