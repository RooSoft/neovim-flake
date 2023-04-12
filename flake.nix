{
  description = "Neovim flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    neovim = import ./.;
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs_unstable,
    neovim,
  }: {
    packages.x86_64-linux.default = neovim;
  };
}
