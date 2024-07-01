{
  description = "Unix pipe example";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell {
        buildInputs = with pkgs; [
          pyright

          python311
          python311Packages.pip
          python311Packages.virtualenv

          python310
          python310Packages.pip
          python310Packages.virtualenv
        ];

        shellHook = ''
          alias create_venv_311="python3.11 -m venv .venv_311"
          alias load_venv_311="source .venv_311/bin/activate"

          alias create_venv_310="python3.10 -m venv .venv_310"
          alias load_venv_310="source .venv_310/bin/activate"

          alias pkg_install="pip3 install --require-virtualenv"

          alias make_pipe="mkfifo named_pipe"
        '';
      };
    };
  }
