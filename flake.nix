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
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    catppuccin.url = "github:catppuccin/nix";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      nixpkgs-stable,
      nix-flatpak,
      nur,
      home-manager,
      catppuccin,
      ...
    }@inputs:
    {

      #  -- x13 gen 1 amd --

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
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nikki = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/niri/niri.nix
                inputs.dankMaterialShell.nixosModules.greeter
                catppuccin.homeModules.catppuccin
                inputs.dankMaterialShell.homeModules.dankMaterialShell.default
              ];
            };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/x13g1amd/configuration.nix
        ];
      };

      #  -- a485 --

      nixosConfigurations.nikkia485 = nixpkgs.lib.nixosSystem {
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
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nikki = {
              imports = [
                ./home-manager/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/a485/configuration.nix
        ];
      };

      #  -- minibook x --

      nixosConfigurations.nikkiminibook = nixpkgs.lib.nixosSystem {
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
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          inputs.nix-chuwi-minibook-x.nixosModules.default
          inputs.dankMaterialShell.nixosModules.greeter
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nikki = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/niri/niri.nix
                ./home-manager/sway/sway.nix
                inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                catppuccin.homeModules.catppuccin
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
          nur.modules.nixos.default
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/minibook/configuration.nix
        ];
      };

      #  -- workstation --

      nixosConfigurations.nikkiworkstation = nixpkgs.lib.nixosSystem {
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
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nikki = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/niri/niri.nix
                ./home-manager/sway/sway.nix
                inputs.dankMaterialShell.homeModules.dankMaterialShell.default
                catppuccin.homeModules.catppuccin
              ];
            };
          }
          inputs.dankMaterialShell.nixosModules.greeter
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/workstation/configuration.nix
        ];
      };

      #  -- home server --

      nixosConfigurations.tcenter = nixpkgs.lib.nixosSystem {
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
            nix.settings.trusted-users = [ "admin" ];
          }
          ./hosts/tcenter/configuration.nix
        ];
      };
    };
}
