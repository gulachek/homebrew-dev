class CpplibrootBoost < Formula
  desc "cpplibroot for Boost libraries"
  homepage "https://gulachek.com"
  url "https://github.com/gulachek/cpplibroot-boost/archive/master/brew.tar.gz"
  version "1.79.0"
  sha256 "2637b534de7579c2fcd7f536a12ef488979a779fdf533c1b1aff1d1adce67942"
  license "GPL-3.0-or-later"

  depends_on "boost"

  def install
    (share/"cpplibroot").install (buildpath/"brew").subdirs
  end

  test do
    (share/"cpplibroot/org.boost.test").directory?
  end
end
