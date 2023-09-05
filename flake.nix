{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils
  }: flake-utils.lib.eachDefaultSystem (system:
    let
      neovim_overlay = import ./neovim;

      pkgsForSystem = system: import nixpkgs {
        overlays = [ neovim_overlay ];
        inherit system;
      };

      pkgs = pkgsForSystem system;
    in {
      packages = pkgs.neovim;
      devShell = pkgs.mkShell {
        buildInputs = [pkgs.neovim];
      };
    }
  );
}
