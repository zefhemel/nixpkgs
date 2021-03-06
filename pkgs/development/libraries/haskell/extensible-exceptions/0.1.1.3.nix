{ cabal }:

cabal.mkDerivation (self: {
  pname = "extensible-exceptions";
  version = "0.1.1.3";
  sha256 = "1i8rjfczsx1wjfaq423a7cp7qrnxh053865z7bg6hwhk2pxsrxkm";
  meta = {
    description = "Extensible exceptions";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
