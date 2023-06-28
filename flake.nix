{
  description = "Nixarr";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {

    nixosModules.nixarr = { config, ... }: {
      imports = [
        (import ./services/sonarr.nix { inherit (config) domain; })
        (import ./services/radarr.nix { inherit (config) domain; })
        (import ./services/lidarr.nix { inherit (config) domain; })
        (import ./services/nginx.nix { inherit (config) email; })
      ];
    };
  };
}
