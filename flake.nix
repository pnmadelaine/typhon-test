{
  inputs = { nixpkgs.url = "nixpkgs/nixos-unstable"; };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      typhonProject = { actions = pkgs.callPackage ./actions.nix { }; };
      typhonJobs = { inherit (pkgs) hello; };
    };
}
