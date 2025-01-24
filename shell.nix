{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    meson
    ninja
    pkg-config
    desktop-file-utils
    python3.pythonOnBuildForHost.pkgs.sphinx
    gettext
    wrapGAppsHook3
    libxml2
    appstream-glib
  ];

  buildInputs = with pkgs; [
    girara
    libintl
    sqlite
    glib
    file
    librsvg
    check
    json-glib
    texlive.bin.core
  ];

  # Set environment variables if needed
  shellHook = ''
    export ZATHURA_PLUGINS_PATH=${pkgs.zathura}/lib/zathura
  '';
}
