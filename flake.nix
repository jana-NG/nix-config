{
  description = "NixOS config flake";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-25-05.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    catppuccin.url = "github:catppuccin/nix";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-chuwi-minibook-x = {
      url = "github:knoopx/nix-chuwi-minibook-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-25-05,
      ...
    }@inputs:
    {
      nixosConfigurations = {

        #  -- x13 gen 1 amd --

        nikkix13g1 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            {
              nix.settings.trusted-users = [ "nikki" ];
            }
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nikki = {
                imports = [
                  ./home/hosts/x13g1amd.nix
                  inputs.catppuccin.homeModules.catppuccin
                  inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                ];
              };
            }
            inputs.catppuccin.nixosModules.catppuccin
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.dankMaterialShell.nixosModules.greeter
            ./hosts/x13g1amd/configuration.nix
          ];
        };

        nikkit440p = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            {
              nix.settings.trusted-users = [ "nikki" ];
            }
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nikki = {
                imports = [
                  ./home/hosts/t440p.nix
                  inputs.catppuccin.homeModules.catppuccin
                  inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                ];
              };
            }
            inputs.catppuccin.nixosModules.catppuccin
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.dankMaterialShell.nixosModules.greeter
            ./hosts/t440p/configuration.nix
          ];
        };
        #  -- minibook x --

        nikkiminibook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            {
              nix.settings.trusted-users = [ "nikki" ];
            }
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nikki = {
                imports = [
                  ./home/hosts/minibook.nix
                  inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                  inputs.catppuccin.homeModules.catppuccin
                ];
              };
            }
            inputs.catppuccin.nixosModules.catppuccin
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-chuwi-minibook-x.nixosModules.default
            inputs.dankMaterialShell.nixosModules.greeter
            inputs.nix-flatpak.nixosModules.nix-flatpak
            ./hosts/minibook/configuration.nix
          ];
        };
        #  -- workstation -- #

        nikkiworkstation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
            pkgs-25-05 = import nixpkgs-25-05 {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
          modules = [
            {
              nix.settings.trusted-users = [ "nikki" ];
            }
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nikki = {
                imports = [
                  ./home/hosts/workstation.nix
                  inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                  inputs.catppuccin.homeModules.catppuccin
                ];
              };
            }
            inputs.catppuccin.nixosModules.catppuccin
            inputs.home-manager.nixosModules.home-manager
            inputs.dankMaterialShell.nixosModules.greeter
            inputs.nix-flatpak.nixosModules.nix-flatpak
            ./hosts/workstation/configuration.nix
          ];
        };

        #  -- home server -- #

        tcenter = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/tcenter/configuration.nix
          ];
        };
      };
    };
}
