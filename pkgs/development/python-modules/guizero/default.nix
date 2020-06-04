{ lib
, buildPythonPackage
, fetchPypi
, tkinter
}:

buildPythonPackage rec {
  pname = "guizero";
  version = "1.2.0";

  src = fetchPypi {
    pname = "guizero";
    inherit version;
    sha256 = "sha256-DY+7DU/F4qr1nnYzukEZ60gRtY70UygXeq5/L8gQsIY=";
  };

  doCheck = false;

  propagatedBuildInputs = [ tkinter ];
}
