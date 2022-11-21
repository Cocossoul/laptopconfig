{
    description = "My darwin configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05";
        home-manager.url = "github:nix-community/home-manager/release-20.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config = { allowUnfree = true; };
        };
    in
    {
        homeConfigurations."coco" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [{
                home = {
                    username = "coco";
                    homeDirectory = "/home/coco";
                    stateVersion = "22.05";
                };
            }];
        };
    };
}
