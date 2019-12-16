{ nixpkgs ? import ./nix/nixpkgs.nix }:

let

inherit (nixpkgs) pkgs;
inherit (pkgs) haskellPackages;

haskellDeps = ps: with ps; [
  free
];

ghc = haskellPackages.ghcWithPackages haskellDeps;

nixPackages = [
  ghc
  haskellPackages.cabal-install
];

in pkgs.stdenv.mkDerivation {
  name = "playground";
  buildInputs = nixPackages;
}
