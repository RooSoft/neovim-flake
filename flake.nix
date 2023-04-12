{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # neovim = import "./.";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_unstable,
    # neovim,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.neovim;
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = [pkgs.neovim];
    };
  };
}
