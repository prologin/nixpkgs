{ lib
, buildPythonPackage
, fetchPypi
, colorzero
}:

buildPythonPackage rec {
  pname = "gpiozero";
  version = "1.6.2";

  doCheck = false;

  src = fetchPypi {
    pname = "gpiozero";
    inherit version;
    sha256 = "sha256-DrlanbNyFGgTJ2+S3n9DyIOj6f5pWX/D0pwE7z1dX54=";
  };

  nativeBuildInputs = [ colorzero ];
}
