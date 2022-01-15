{ config, pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDir = "/Users/${username}";
in

{
  users.users.andrew = {
      home = "/Users/andrew";
      description = "Andrew Nijmeh";
    };

  nix.nixPath =
    [ "darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"

    ];

  environment.systemPackages = with pkgs; [
    wget
    (pkgs.writeShellScriptBin "nixFlakes" ''
      exec ${pkgs.nixFlakes}/bin/nix --experimental-features "nix-command flakes" "$@"
    '')

  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

 
  system = {
    stateVersion = 4;

  };
  
  networking = {
    dns = [ "1.1.1.1" ];
    search = [ "local" ];
    knownNetworkServices = [ "Ethernet" "Wi-Fi" ];
  };
  
  nixpkgs = {
    config = {
        allowUnfree = true;
        allowBroken = false;
        allowInsecure = false;
        allowUnsupportedSystem = true;
      };
  };
  
  nix.extraOptions = ''experimental-features = nix-command flakes''; 
  nix.maxJobs = 8;
  nix.buildCores = 8;
}

