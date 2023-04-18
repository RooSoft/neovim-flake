{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_unstable,
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
