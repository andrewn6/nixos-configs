{ config, pkgs, ...}: {

  home.username = "andrew";
  home.homeDirectory = "/home/andrew";
  imports = [
  ]; 
  
  # deprecated flakes.enable = true;
  # deprecated programs.home-manager.enable = true;

  # All dev tools, and productivity programs I need installed (excluding Mac
  # Only applications (those are installed using homebrew.)
  home.packages = with pkgs; [
    neofetch
    pfetch
    tmux
    alacritty
    direnv
    starship
    # these are manually installed (they break when installing on m1)
    # firefox
    # element-desktop
  ];
  
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "FiraCode Nerd Font";
        size = 16;
      };
      selection.save_to_clipboard = true;
      mouse.hide_when_typing = true;
      # snazzy
      draw_bold_text_with_bright_colors = true;
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xebdbb2";
        }; 
        normal = {
          black = "0x282828";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0xa89984";
        };
        bright = {
          black = "0x928374";
          red = "0xfb4934";
          green = "#0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xebdbb2";
        };
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Andrew N";
    userEmail = "andrewnijmeh1@gmail.com";
  };
  
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
    };
  };
  
  programs.gpg = {
      enable = true;
  };

  # programs.neovim (removed because I use LunarVim (no nix support))
  
 # programs.direnv = {
    #enable = true;
   # nix-direnv.enable = true;
 # };
}
