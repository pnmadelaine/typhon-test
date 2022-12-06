{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    typhon.url = "github:typhon-ci/typhon/dev-pnm";
  };
  outputs = { self, nixpkgs, typhon }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      libTyphon = typhon.actions.${system};
    in {
      typhonProject = libTyphon.mkGithubProject {
        owner = "pnmadelaine";
        repo = "typhon-test";
        token = ./secrets.age;
      };
      typhonJobs = { inherit (pkgs) hello; };
    };
}
