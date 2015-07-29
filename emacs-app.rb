require 'date'

class EmacsApp < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://github.com/emacs-mirror/emacs.git"

  keg_only "Have to move the app out of the Cellar anyway"
  
  version Time.now.strftime("%d-%m-%Y-%H-%M")

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "imagemagick"
  
  def install
    cpus = `sysctl -n hw.logicalcpu`.gsub("\n", "")
    ENV["CPPFLAGS"] = `xml2-config --cflags`.gsub("\n", "")
    
    system "./autogen.sh"
    system "./configure --with-ns"
    system "make -j#{cpus}"
    system "make -j{cpus} install"
    prefix.install "nextstep/Emacs.app"
  end
end
