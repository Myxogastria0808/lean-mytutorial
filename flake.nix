{
  description = "lean flake sample";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # nixvim
    nixvimConfig.url = "github:Myxogastria0808/nix-flakes-nixvim/main";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # language
            # lake (lean package manager) is included lean4 nixpkgs.
            lean4
            # lean version manager
            elan
            # editor
            inputs.nixvimConfig.packages.${system}.default
          ];
        };
      }
    );
}
