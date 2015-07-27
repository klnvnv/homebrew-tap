require 'date'

class EmacsLatestGit < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://github.com/emacs-mirror/emacs.git"

  version Time.now.to_s

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "imagemagick"

  def install
    system "./autogen.sh"
    system "CPPFLAGS=`xml2-config --cflags` ./configure --with-ns"
    system "CPPFLAGS=`xml2-config --cflags` make"
    system "CPPFLAGS=`xml2-config --cflags` make install"
    system "open nextstep"
  end
end
