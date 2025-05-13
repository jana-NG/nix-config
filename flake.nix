{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
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
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nikkia485 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
          ./flatpak.nix
        ];
      };
    };
}
