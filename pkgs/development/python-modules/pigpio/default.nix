{ lib
, buildPythonPackage
, fetchPypi
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "pigpio";
  version = "1.78";

  src = fetchPypi {
    pname = "pigpio";
    inherit version;
    sha256 = "sha256-ke+lDkmQZJ2pdAijhHgtbM9YNC/FnN/iHtekKRFWmXU=";
  };
}
