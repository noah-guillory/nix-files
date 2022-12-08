# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays your own flake exports (from overlays dir):
      # outputs.overlays.modifications
      # outputs.overlays.additions

      # Or overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "noah";
    homeDirectory = "/home/noah";
    packages = with pkgs; [
      ripgrep
      vscode
      _1password
      _1password-gui
    ];
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Enable Man Packages
  programs.man.enable = true;
  home.extraOutputsToInstall = [ "man" ];


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


  programs.git = {
    enable = true;
    userName = "Noah Guillory";
    userEmail = "noah@noahguillory.me";
  };

  programs.java = {
    enable = true;
  };

  programs.go = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
  };




  programs.jq = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.gpg = {
    enable = true;
    publicKeys = [ {
      source = ./dotfiles/personal_key.txt;
      trust = 5;
      } ];
      settings = {
        personal-cipher-preferences =  ["AES256" "AES192" "AES"];
        personal-digest-preferences = ["SHA512" "SHA384" "SHA256"];
        personal-compress-preferences =  ["ZLIB" "BZIP2" "ZIP" "Uncompressed"];
        default-preference-list =  ["SHA512" "SHA384" "SHA256" "AES256" "AES192" "AES" "ZLIB" "BZIP2" "ZIP" "Uncompressed"];
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        fixed-list-mode = true;
        no-comments = true;
        no-emit-version = true;
        no-greeting = true;
        keyid-format = "0xlong";
        list-options  = "show-uid-validity";
        verify-options = "show-uid-validity";
        with-fingerprint = true;
        require-cross-certification = true;
        no-symkey-cache = true;
        use-agent = true;
        throw-keyids = true;
    };
  };



  # Fish Shell
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "extract";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-extract";
          sha256 = "sha256-hFM8uDHDfKBVn4CgRdfRaD0SzmVzOPjfMxU9X6yATzE=";
          rev = "5d05f9f15d3be8437880078171d1e32025b9ad9f";
        };
      }

      {
        name = "bang-bang";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bang-bang";
          sha256 = "sha256-35xXBWCciXl4jJrFUUN5NhnHdzk6+gAxetPxXCv4pDc=";
          rev = "816c66df34e1cb94a476fa6418d46206ef84e8d3";
        };
      }

      {
        name="foreign-env";
        src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-foreign-env";
            rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
            sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }

      {
        name="git";
        src = pkgs.fetchFromGitHub {
            owner = "jhillyerd";
            repo = "plugin-git";
            rev = "a7bf861097d34f4db0fd7384bc19c712148feb55";
            sha256 = "sha256-wEodvtKkv9zxCDJcziCx2+KEdFo+yKgBnLOc/cu9mJ8=";
        };
      }
    ];

    shellInit =
    ''
        # nix
        if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
            fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        end
    '';

  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # GPG Agent

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableFishIntegration = true;
    enableScDaemon = true;
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
    pinentryFlavor = "qt";
    extraConfig =
    ''
    ttyname $GPG_TTY
    '';
  };

  home.file."spacemacs".source = ./dotfiles/.spacemacs;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
