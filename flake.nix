{
  description = "Andrew's nix-darwin flake";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations = {
      andrew = home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        homeDirectory = "/Users/andrew";
        username = "andrew";
        stateVersion = "21.05";
        configuration = {
          imports = [
            ./home.nix
          ];
        };
      };
    };
  };
}
