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
      text = ''
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: Hockeypuck 2.1.0-184-g50f1108
Comment: Hostname:

xsFNBGG/3+wBEACx0BhRV36Wwum/NN1IV9k/FZZVv9hoRxYducE3ijtCT/q1f5+a
6CVriigo18lHzEMX8TcDJAF1l/5UEnLqD8nGX1QaqPNW34d864XCSW7e5qlPRjpg
zJdCYMC2QZBaBbaKp87VMH1o2BL2+a9HGN7PIrTIytxnqVm5PTFETPr0aq+S1n6/
JupLzRBv5tjP69cCjLFnfJ2kDWphUPLEuuc2Jw3mBjyMBLEXebPFX9UhYXGop/u1
lIxRBIL9n64XRcURl/WrCaNH4H/71WMpDorbzrAmYL1d7g8fmp1yRr08zSYaHMjp
Acyu+/BBV1zs41jBOW9geGRLr1oRxUdeRFSg6gq5YDUx9HqA3lpPlvhzRbld6lN1
txhOkDpY1OIsSfJMvoJSLeMHDS0PWqokPbzAw9qE9WYt6CrPlqJnsoQaWm1T6+ab
n6vZVF38eLC64J0Cgd6RHphJrgUunQhO7x+slBiiqcU48GsaJ/PjohlbbDE9EC0X
OTx0NktGMZLXyBoE4XBa9nhYKaqdONL9QqQ+ldCTG4tB1JE0+rOqokVxpIR1VNFu
wMlLne4IyB1KC9/5q/p0sxah46MfaWpbOzikJghLqIGgI1Qje6thEB1iQ96YyY6c
qklyVQpIfW/mUA+ggKonM7PtTvy6jt9y4YFokQl2HTih4EAQ2QqkvEY2RQARAQAB
zSROb2FoIEd1aWxsb3J5IDxub2FoQG5vYWhndWlsbG9yeS5tZT7CwY8EEwEKADkC
GwEECwkIBwQVCgkIBRYCAwEAAh4BAheAFiEEEtGpToCS+76shmuQq9emD/EbTPQF
AmG/4RoCGQEACgkQq9emD/EbTPQ/pQ//buCskUPhUlcgYF6JR9L08EXnYLl/z37t
UnSYp89wfbPimn/Cgeh6YuhwVyVcxt64FnATU0hqhDlJFG7PtqGy3WNHWux3zdsG
i8gdEzvyjeGmiuR+2MBLcXCP8WTSsag/71/4H1M4jtgk5uHir9/SprPA3aPLo5jX
7yckRI+qFOWW1+qVG1v/SaPF7dpQ89KRbAPMx+Gk6CPOZJMGew7plGjKYDjFeZIf
VOPnD6s61ioOMIFyX0iFCI8tyiCpqNcVfg1Xmb+pj4ijyUiY74ttl9bgiuzqq7It
gQQx4TkHd9pmcyoa9x1dzKlOUmeAykcYMTLdPrXcXaf3pj21Xabn4AxbrkxXsE6p
AWL7umLYqOQ9/QLjD1fgpi3iPuJWk6RrN1qHf3LB2lFX3T1ex4Xsse4ME9u5gn9h
jzruS94b6UKP37aQ4835TGBqJdt64sCBrKi7zQ7asxqRla4UUKUCDmIMJ3F63ebt
dcHjQXLQIa96gKrDvRnDsfaBsnn3coBUUC60PM2tEgBvxYKBbpXnG5s3XAR9AIos
B1D+zDu4bGy9JWeNi+9Mviiif6ZgUEPKPrKaXstArwskudtY2RBFhqZ4XPhzBmcL
zngmjHeWeORnDm/ZfnGNFxJ37LShUfWW9y+Vj4bNerPIXYRXJA7VULey++S2CoRm
2pSWTvuZ93bNJU5vYWggR3VpbGxvcnkgPG5vYWhAbm9haGd1aWxsb3J5LmNvbT7C
wYwEEwEKADYWIQQS0alOgJL7vqyGa5Cr16YP8RtM9AUCYb/g3QIbAQQLCQgHBBUK
CQgFFgIDAQACHgECF4AACgkQq9emD/EbTPTcuA/+Kj2335lxNqmX4euCgOTCIJvZ
yaOJuBqFpVHdKI5dSQlwkTKZNBay/Y4x8serlGuDA0qRIwBzPEG5UQb6/uTL5kjf
XNWkgMHTP8AFj/lV13ysmZs3uITmCKvKnXEgJNJOHmmEuSUsTcF95hNdpp1FJ4QW
wNpxpX22AK3KyTXbfZZHJDMWeLwFwJ7Me7k1MD89QuulCXS6i5goXPCFktQZ+DPQ
91gQ48RQpt16mu0Z8CSoh4lRopOYMvpV1ANioGev3DhNX8FTH0GFZpUWhf9sGSeZ
qoUyDB3GVb8u+vSmpzgCNuKh2Mh0rgrEu8ezOBIqIUl0Iw2/TUE8mX1QpavqDYPU
fJSrYemfreVgDo9TWEEJKQWVVYWzD80taXOOYN605oXhyumCOHHjysfEcWXEwYp7
du6L/6bFQvj/NOCADrBQO7gIf9LLFtaEMvUJOMiZCoJVy7L1b7F9eIEjv13Z1OQF
xmcxq74m66ivmSfR7m9SV3Nthgt/fSpA8Z3q0Np4YNUOPMRaJ88WcQIyNcgdR+2M
EqSCnS6J6eakz5rQSNex0vTiwFRDZs9IYLtqRO3PCMem0MNsLMVspBO1ok5G+jHJ
BCPBGVHzsXBMeBbVKCf/h3+q48LDQjEJqzOzikVJOy/ir/gz4L78boH4aG8hyppE
l7A9suejPeFwVVLMCvHOwU0EYb/goQEQAMZkT5t8tVBOOF5kF3F+gev/TwzzT3wE
nehmqQZiIi3cJ71IXXC+Ae43KT+4bJ87r47u5TWIUC0b0EyLlhNnyDh0tutK9M4W
mkO2Wei+XOsHKNRqfP49fX7CDkqYhbzuZxUspqHjdA5J+LvEcRbNz8m2e7VWdEzQ
3JHfGmY9wVSYrtpAa96oM1Cj4xwMbyhCsr9oTQRlMRf2LbJEh302zVyOGJyondqf
sgoU5K4Ilqk+fnFaYaWK6pJvNFdB1RrIC5lZJmD/bmyLqMA4JZ3GvpILu3p77bTz
U7z11eQKYvHonaDc0FJPNxQH5CPi0JNUu/LdecSQQCYiqlkprrPaNXmoXI6Rt7B6
osv6huY+rweOoYH0vYQgub+piNxiyuFCpDCcnGdE0WSNjAnokzlh7xaHnpOe3fMy
wG6pxMvwbOEof1WOxyP1NFjwudRORx7M9E+D4fDjxtXnlOJ/NlUsIfzOvtYss+hq
ey6MttDNl5GDwdZS5j1Ab5tsLdlVFiCzPVTqKDwyQMIc5iOuvpsn+869+zMCbl6i
qFW+TWhSM5dP+gfVdXA5J6GViKsocBnHzFVh38rWdGQG/A+C669pq4LWrOBYi8hE
CHMzkE+7Nj8bUFbHhjUC9ZrtnbNnj1RtJzwJOl8VLEEEiVIhqyjtYZ2Lih4KiYnM
VmG7zODqzhu5ABEBAAHCwXYEGAEKACAWIQQS0alOgJL7vqyGa5Cr16YP8RtM9AUC
Yb/goQIbIAAKCRCr16YP8RtM9FwrD/476P9reZpZuo3DldP+nyaChyHt5yw3WvgL
Jxy4HeDxiGz8AISlhmekaMezZOblY2qqM1uMy1cxMXmvfgQUKdc91n2EDPvh53U+
XMH71T2nWsTP1vS+Hj9vzoBj0XBWPn1OxieDJMOItmbXf6x809WVU0YTrpyVH6Zg
Y8l6g2Kif6CawcZDOz+HSQeHuhq78KXTSwc4+mG+RBn5bxR9zIgT1PZhfgAypmLE
owqpvN9OZlQSnm+S2yBGT1EJbekxbemowHBBdTRM3kxBGOfuyozZkPJMOqS2EcB+
d8d8mVcM5Dic5byPO3PCnKUv2Rm3UorjTxVt3r4RiqTZTmtSlagBNRBjjFO4h/El
koQpxevOMdF1NG+fKD4SSArhQb37D8VqRJA7tavUguwyQ+6XbOJ15TSoPqrt9+/c
Pfv5pOnWjSS7uqufluEQgktfOlrWJsyhM2CC5eO/PHO3PyB1HLAsysBKVvfT2JMa
hunS5Jx71Z6y7RiWBugQTpeAEUKZ2LY9IhCIohhupBAF9ph7IKQd/lPibVfd+e9w
gGz03wpQYvpjI9zHVU7ebt/MFL4oGGasgR4iysWhV/rRY3DJAYv3slWqmH0/65wF
NxNd+eNCDdy1BLpyxIwz0Ue4OISbEjAvWGvgXXfIyIHLY7BKYa7NfIQ4WhLSCRl1
hJxK3I8QR87BTQRhv+CKARAA9CNRM6OZrb1+hjzEnoJEgqdqShnmSJy7DEp6uOTY
Z5XUhuYjnkJuEWxw7+o1CrbXZGzqz0uSO+ZXWLsI/Sso/UHLoYbgV3wfiNLC9AcQ
mn9i7M8IxiemcsCXsCGohy8+1PHdvut8QePgy82CTmTEpr4uSTZMnIKz+Ljmsq1k
+qmiK429z2IXAgGw2U4OWmpdSU3YT4EdIHjAOfC4ZJEpVK6Ea64PiBM/TGnfe75Y
Ri/zt13J5K8pQO3M1WAxQmA6ZbTxsMAJMMjA91GGJFfCZlQ1zjLm6aSfyTAAwDpF
077PTLSKZKCUoae7/kJZOahRTqsX+NgYaqImKEpIfMN9Jnq9RMp7Px6SEA/2QAJx
4SRckDUr4DNje3jU/WWhx0PYZY11bNkr4U86OOcDfOKpuQcdhZUSOfCd/2OTJrv0
uTHSfUStAEM74EWxU2BR7JSgXCMyNc5diDtviOxQTE+UYBNWjga/uZigOclgZBsX
xFWcqFGJ0jxgSdjv9nD9r13nz3OulGJ0KVq+3YLU4UqaQQWnbECfX3LqIC5Mado2
7CZ3XkLHSNYppOS35J83NKy5xEgXB4cqEksfPwXSVbP6JFYSIAduUBgx23PUki2U
kxiTo6lu7LU9kN2WMWA5xgl2MiI4xI1Z/wXexaVAtLKJrubY6hbsBiA0ugL5S/m4
rYkAEQEAAcLBdgQYAQoAIBYhBBLRqU6Akvu+rIZrkKvXpg/xG0z0BQJhv+CKAhsM
AAoJEKvXpg/xG0z03tgP/27XfObnGFuoCU+KGJm08hrWuyNQhjWvbCBX2JyAzQGp
wRu3JrM6neF1C35nWW26a+V3xzCdr8DNmD4MbTuRS6xq0Jv6R7PO8sCDw1b4cqcZ
kqUjwh72xa4S6Q95eV8/8eR8kEVkfHp/7tknsK/uk9JEU81zG0yAyQw9os6kugAK
ield2ZhLg6BJF+ogSWR7ENh2hd+dXbc8A7wmC8hF3lsKVkNsV6fIUegqsaF01TNI
YA4fvJeZjCG8YXtMgv7E/ClXCcgP3I6XCjhESA591fKWSjUr+BDb38QIoeIutH+l
GJOqcnI5Px3cSGyE3zXRDbIPkEYFCXr84Ge+kXJ/K0qAUZHANpQhKL4s+tvA0mCX
Skwnz+IhqKWZmF7EJ+ExJxycWhhy3/PFUpVI7pCYcwEEWZnkVxPPx0fTwQ2A66zW
b8lBDiBKKuPR9HfjY7COBz/H5B1DkO/ciKNDSDupvIZtHn5rOyI7O6C4yupPcAVy
iMqnRsmsbmxYM417CrfWanGBg9c4KQjlbTaCfhFEqz/R9IK+9VdJftXkXceN5A2M
BPk4Pv977m8Mxf+wKmMqkaChYMm5b36AVEEqK38WeOQanwLjVlN5WQU5rw4n//5J
JzRhWjo4Hhl7MD5reareVWOpglnS9F/63jYpP8ohVmxuy6C3Kl4P6b4KPN/Bxnx1
zsFNBGG/4FwBEACtEmsjbtscaJ8HiK8w0Nsf4fk0BUtcRvIY1rJKhdRzrzEWlzy5
t/wp4670R/h5H6Du7M6Aes3f9iszl7YGQhfc64zOVQuNsYCivyznausU2DfSwFhj
4rUmmp1Axj5xaRbK+RjNa0J1n8+F1prUr4hQD3BwcVUDeWJIHpPG6YDf+cWB946N
1Ql9JsBDrFZnjpebJxU9u/0491kjzqu0xLuebDbhTfjYlVEoixOinKL9VHmUd7Ku
rMPNMezY5Vu30scca+s5nNM13tqdK6NwEhCZ88dEh8/GgA0dcLcMRbx8p8MUJufd
9fMUrwd90vvN657F0NpHBLTmm7wXjdtDkY+MmY7HkIYVnoUmt7p7pr+BOjrGR4wY
S7HUOwlYnMB2d8ez9lZWcGnsfVekhptRulqzTSvAcMgYgEpv7ehVUerLslZ/sSkb
UUW46FsoY4A5KsBxJFr7c1CEOhzA0SuwAqAeIRHYgnelqfaTWShwY7rxLGgnZYdx
/JJ/1RGTf8d9b1fEFYe+r5jGPz9suNewsUF8iucgpo/HOgDnEMbqaU2jUPQU33wH
lBjZhiodV39tiBQYTRbnmLllS8OUOvtOZoiAxIWsDnDLtSqyBjuLtyKMner67RTe
DiBvO/6EwEfEPSdHNLnXKYRFGPiJx8V7cJ2M/dpl8Sqc7/m0pQX0cSx/cwARAQAB
wsOsBBgBCgAgFiEEEtGpToCS+76shmuQq9emD/EbTPQFAmG/4FwCGwICQAkQq9em
D/EbTPTBdCAEGQEKAB0WIQQXwBq9mdtmM81XyUk9OlbET9ZgpwUCYb/gXAAKCRA9
OlbET9Zgp3UnD/9VdXoYy7XLdCYqrb1kuvpdtVyrfZuonBP6hlR9+8bxzqOX+2g9
dAsIDHCZ6nZ4rc3/lQYmzIPf+vz59spmAn3jUPc8AdGJaTymgyTTxq5dh3jSjSkj
/QDUMaS+1Xp1jmVkLqQoFQ3wHDGsTxk1huwMDyKeOohfCNPSqUPFepmrNA7HdiiN
BT2CV2RQ8N9tjHU/WVEnL5h/UT+hh+nl2Frsm4rmJlgkeO41OhZt2flhxZBikNkV
n55a3ZXx3d4zA9xAZDnl1XJwXQoSNe7H9/842pHlTB7TBGjBX8elLd2+2bub98Fo
QrLcNID4bj1JA2/yXZ+jAqK1FqsFpgRicZshMwxtbyjCxR+y3WBV/ha2gzGG9ZXJ
d7m29ushZntopBWkpmbX1Su3c73ok5mT0ON6MvKzTVfI5U9rOQ9fk341GJ7pR3C4
TnAXD+pV6zagCmGLCHhpsiDARLi6S09l/jD9b7+1Vpn7FWdc/Ch4BpLdckZlu0Dw
c9Owzp1bEts5V3X7yvNHRzGzvbQzrubXsE9Te14u3Df7EkECelGUCIS6d9LD8Xn5
10dSr2YXs+6YfdSSmX10EK/VemL+7jR1SYdgXFe4nmdnq1Vyg+FmVYcW0vzkCNcu
G59rcZAr3vKQi0pNh1mmKM/8Ujoc9qcX73z3vWRutn+N86kT1uFSHrlRt9eRD/9Z
PDzh7+DUFpvS1aa49JdFR3svxR7XCQyvfa9Z8rfy6OvNAv43y2sn8S0PhtkdgId2
MK40SlFspj/rcMBFKEIZCo6IdSNfFaQGEN+ZiGt7L4y2KMbgjb9IQMf+fdhkaTBW
g/SPirMhNpDc7L4HcX0ZLzjb3gkQI74xfZ5PmD9/AX4r3QNndRGjS7RCBHXhlk5W
MSWqCQXP+dG/3zMLxaLcozHUfEDKKoxDqEJ7KIjpxSnP9jAEkbD1AcU+Ov/8Z1F+
HaEhvNqhb1WPvdzwNtrc8aoAkbG8ijru7dHCIcPuknrAUsi3d7xuG5icrVo57xU9
J91CKRYKbVKenAnLYpYSjQCB9to/6/jxUwlwDVfhGthfmCkedvnH0T8eqzxACkLF
ggFRLwsCYjPPHXlQDB56SV7Q7wtH+CkCETM4Ly6lgEJnBvpbX0UJOId8hkDLBsKz
fAU2fzxfWRixtntyfqaCUXH1GHTfZj1oOcR22/BNRyrHOoiunrHxTAIuHKn7Zqx5
ZDThctV9PR9Nx19EUaIkxfJmPLsEcXJGQoCYuSFXg80cskBtwUn2b236Mgj9PwP1
uEXl/SzctYRU3KCd38wSQVA6cYydbjq9YzLtX7XhRVyWfou+c4sSyAspsCvD2wB6
K7TJPl24PbvMoFChPhBi97i1u64y8fLh1CYzN0MtQA==
=1uQc
-----END PGP PUBLIC KEY BLOCK-----

'';
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}