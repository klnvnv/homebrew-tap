require 'date'

class EmacsLatestGit < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://github.com/emacs-mirror/emacs.git"

  version Time.now.strftime("%d-%m-%Y-%H-%M")

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "imagemagick"

  cpus = `sysctl -n hw.logicalcpu`
  
  def install
    system "./autogen.sh"
    system "CPPFLAGS=`xml2-config --cflags` ./configure --with-ns"
    system "CPPFLAGS=`xml2-config --cflags` make -j#{cpus + 1}"
    system "CPPFLAGS=`xml2-config --cflags` make -j#{cpus + 1} install"
    system "open nextstep"
  end
end
