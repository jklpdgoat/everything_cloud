{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (ps: [
      ps.flask
      ps.pip
      ps.pylsp-mypy
    ]))

    pkgs.curl
    pkgs.jq
  ];
}