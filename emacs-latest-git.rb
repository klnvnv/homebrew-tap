class Emacs < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://github.com/emacs-mirror/emacs.git"

  depends_on "imagemagick"

  def install
    system "./autogen.sh"
    system "CPPFLAGS=`xml2-config --cflags` ./configure" "--with-ns"
    system "CPPFLAGS=`xml2-config --cflags` make"
    system "CPPFLAGS=`xml2-config --cflags` make -j3 install"
  end
end
