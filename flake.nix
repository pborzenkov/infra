{
  description = "pborzenkov's infra";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.rnix-lsp
          pkgs.nixpkgs-fmt

          (pkgs.terraform.withPlugins
          (p: [ p.namecheap ]))
          pkgs.terraform-ls
        ];
      };
    });
}
