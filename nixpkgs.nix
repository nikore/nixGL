let
  rev = "0b73e36b1962620a8ac551a37229dd8662dac5c8";
in
import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/${rev}.tar.gz";
})
