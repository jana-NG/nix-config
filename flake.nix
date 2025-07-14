{
  description = "NixOS config flake";

  nixConfig = {
    substituters = [
      "https://cosmic.cachix.org/"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-flatpak,
      nur,
      nixos-cosmic,
      ...
    }@inputs:
    {
      nixosConfigurations.nikkix13g1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          pkgs-stable = import nixpkgs-stable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          {
            nix.settings.trusted-users = [ "nikki" ];
          }
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          ./hardware/x13g1amd.nix
          ./flatpak.nix
          nixos-cosmic.nixosModules.default
        ];
      };
      nixosConfigurations.nikkia485 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          {
            nix.settings = {
              trusted-users = [ "nikki" ];
              substituters = [
                "https://cosmic.cachix.org/"
                "https://nix-community.cachix.org"
                "https://cache.nixos.org/"
              ];
              trusted-public-keys = [
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              ];
            };
          }
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          ./hardware/a485.nix
          ./flatpak.nix
          nixos-cosmic.nixosModules.default
        ];
      };
    };
}
