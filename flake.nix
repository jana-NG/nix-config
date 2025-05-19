{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
      nix-flatpak,
      nur,
      nixos-cosmic,
      ...
    }@inputs:
    {
      nixosConfigurations.nikkia485 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          {
            nix.settings = {
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
          ./configuration.nix
          ./flatpak.nix
          nixos-cosmic.nixosModules.default
        ];
      };
    };
}
