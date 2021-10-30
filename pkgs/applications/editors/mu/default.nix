{ lib, python3Packages, fetchFromGitHub, xorg, qtserialport, wrapQtAppsHook, makeDesktopItem }:

python3Packages.buildPythonApplication rec {
  pname = "mu-editor";
  version = "1.0.3";

  doCheck = false;

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-XNAYh5tZOglE/CNW6dyO5SpPlrHd9hqh5VGbuYkJfL0=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace "pyqt5==5.14.1" "pyqt5==5.15.2"
    substituteInPlace setup.py --replace "PyQtChart==5.14.0" "PyQtChart==5.15.0"
    substituteInPlace setup.py --replace "pyserial==3.4" "pyserial==3.5"
    substituteInPlace setup.py --replace "matplotlib==2.2.2" "matplotlib==3.4.1"
    substituteInPlace setup.py --replace "pgzero==1.2" "pgzero==1.2.1"
    substituteInPlace setup.py --replace "qscintilla==2.11.4" "qscintilla==2.11.6"
    substituteInPlace setup.py --replace "qtconsole==4.3.1" "qtconsole==5.0.3"
    substituteInPlace setup.py --replace "pycodestyle==2.4.0" "pycodestyle==2.7.0"
    substituteInPlace setup.py --replace "pyflakes==2.0.0" "pyflakes==2.3.1"
  '';

  nativeBuildInputs = [ wrapQtAppsHook ];
  propagatedBuildInputs = with python3Packages; [
    appdirs
    black
    colorzero
    flask
    gpiozero
    guizero
    ipykernel
    jupyter_client
    matplotlib
    nudatus
    pgzero
    pigpio
    pillow
    pycodestyle
    pyflakes
    pyqt5
    pyqtchart
    pyserial
    qscintilla-qt5
    qtconsole
    qtserialport
    requests
    semver
    setuptools
    virtualenv
  ];

  preFixup = ''
    wrapQtApp "$out/bin/mu-editor"
  '';

  postInstall = ''
    mkdir -p $out/share/applications
    ln -s ${muItem}/share/applications/* $out/share/applications
  '';

  muItem = makeDesktopItem {
    name = "Mu";
    exec = "mu-editor";
    comment = "Mu Editor";
    desktopName = "Mu Editor";
    genericName = "Python Text Editor";
    categories = "Development";
  };

  meta = with lib; {
    homepage = "https://codewith.mu/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ risson ];
    platforms = platforms.all;
  };

}
