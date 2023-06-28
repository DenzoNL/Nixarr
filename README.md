# (WIP) Nixarr

An opinionated Nix Flake containing a pre-configured *arr suite with NGINX reverse proxy to make setting up a NixOS-based media server a breeze.

## Motivation

Since Sonarr, Radarr and Lidarr are all cut from the same cloth, and mostly everyone sets it up in the same way, it made sense to me to build an easily re-usable flake. This allows me to extract it from my own system configuration and easily share it with others.

I can also easily decouple the Nixpkgs version it uses this way for this set of apps from the rest of my system.

## The includes *arrs

- [X] Sonarr
- [X] Radarr
- [X] Lidarr

## The default setup

By default, each service is reverse-proxied to its own subdomain within your given domain. E.g.:

- https://sonarr.mydomain.com
- https://radarr.mydomain.com
- https://lidarr.mydomain.com



## Example Usage

To import and use this in your own NixOS flake:

```Nix
{
  description = "My NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixarr.url = "gitnux:DenzoNL";

  outputs = { self, nixpkgs, nixarr }: {

    nixosConfigurations.myConfig = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { pkgs, ... }: {
          imports = [ nixarr.nixosModules.nixarr ];
          domain = "mydomain.com";  # replace with your domain
          email = "myemail@domain.com";  # replace with your email
        }
      ];
    };
  };
}
```

Note: You will still need to configure your own indexers, download clients, and most importantly, authentication!