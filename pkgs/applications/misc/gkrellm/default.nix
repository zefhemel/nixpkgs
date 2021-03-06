{ fetchurl, stdenv, gettext, pkgconfig, glib, gtk, libX11, libSM, libICE }:

stdenv.mkDerivation rec {
  name = "gkrellm-2.3.4";
  src = fetchurl {
    url = "http://members.dslextreme.com/users/billw/gkrellm/${name}.tar.bz2";
    sha256 = "0mjg2pxpiqms7d6dvxzxvpa420cakhpjxvrclhq0y8jd2dlv2irl";
  };

  buildInputs = [gettext pkgconfig glib gtk libX11 libSM libICE];

  # Makefiles are patched to fix references to `/usr/X11R6' and to add
  # `-lX11' to make sure libX11's store path is in the RPATH.
  patchPhase = ''
     echo "patching makefiles..."
     for i in Makefile src/Makefile server/Makefile
     do
       sed -i "$i" -e "s|/usr/X11R6|${libX11}|g ; s|-lICE|-lX11 -lICE|g"
     done '';

  buildPhase = ''
     make PREFIX="$out" '';
  installPhase = ''
     make install PREFIX="$out" '';

  meta = {
    description = "GKrellM, a themeable process stack of system monitors.";
    longDescription =
      '' GKrellM is a single process stack of system monitors which supports
         applying themes to match its appearance to your window manager, Gtk,
         or any other theme.
      '';

    homepage = http://members.dslextreme.com/users/billw/gkrellm/gkrellm.html;
    license = "GPLv3+";

    maintainers = [ stdenv.lib.maintainers.ludo ];
    platforms = stdenv.lib.platforms.unix;
  };
}
