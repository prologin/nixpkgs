{ lib
, buildPythonPackage
, fetchPypi
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "colorzero";
  version = "2.0";

  src = fetchPypi {
    pname = "colorzero";
    inherit version;
    sha256 = "sha256-59WlwmzQ3DexZOvvxgnziN4k+Fk7ZZGR4S2F+PnV61g=";
  };
}
