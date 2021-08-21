{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let

  atlas = perlPackages.buildPerlPackage {
  pname = "Atlas";
  version = "1.1";

  src = fetchurl {
    url = "https://github.com/heph2/atlas/releases/download/v1.1/atlas-1.1.tar.gz";
	  sha256 = "1hzladzchnbszyvfp3h1qddgnq30cslsrz55ljw0dc404fsszf6h";
  };
  
  propagatedBuildInputs = with perlPackages; [
    IOSocketSSL XMLRSS URI DateTimeFormatStrptime HTTPDaemon ];

  buildInputs = [shortenPerlShebang];
 
  preBuild = ''
   patchShebangs script/atlas
 '';       

  postInstall = ''
   shortenPerlShebang $out/bin/atlas
  '';

  };
    
in
pkgs.dockerTools.buildImage {
  name = "atlas";
  tag = "nix";

  contents = [ atlas ];
  config = {
    Cmd = [ "${atlas}/bin/atlas" ];
    ExposedPorts = {
      "9000/tcp" = { };
    };
  };
}
