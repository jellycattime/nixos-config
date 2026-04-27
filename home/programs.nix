{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "max";
      user.email = "maxim22ananin@gmail.com";
    };
  };

  programs.bash = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
    enable = true;
    # theme = "agnoster";
    # theme = "robbyrussell";
     theme = "sorin";
    # theme = "steeef";
    # theme = "af-magic";
    # theme = "avit";
    # theme = "bira";
    # theme = "candy";
    plugins = [ "git" "kubectl" "docker" ];
    };
    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
        
    shellAliases = {
      gs = "git status";
      gd = "git diff";
    };
  };
}