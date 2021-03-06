{stdenv, fetchurl, autoconf, automake, zlib, pcre, w3m}:

stdenv.mkDerivation {
  name = "privoxy-3.0.12";

  src = fetchurl {
    url = mirror://sourceforge/ijbswa/Sources/3.0.12%20%28stable%29/privoxy-3.0.12-stable-src.tar.gz;
    sha256 = "16ngim1p4pb4zk8h7js4zjw280fxqxamasfngixikp2ivmzxl469";
  };

  buildInputs = [automake autoconf zlib pcre w3m];

  patches = [./disable-user-error.patch];

  preConfigure = ''
    autoheader
    autoconf
  '';
}
