{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  packages = [
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer
    maturin
    python3Packages.venvShellHook
  ] ++ lib.optionals stdenv.isDarwin [
    libiconv
  ];
  venvDir = ".venv";
  VIRTUAL_ENV = venvDir;
  RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
  LD_LIBRARY_PATH = lib.makeLibraryPath packages;
}

