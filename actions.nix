{ stdenv, writeShellScript }:

let
  echo = writeShellScript "echo" "cat";
  secrets = ./secrets.age;
in stdenv.mkDerivation {
  name = "actions";
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
    ln -s ${echo} $out/begin
    ln -s ${echo} $out/end
    ln -s ${secrets} $out/secrets
  '';
}
