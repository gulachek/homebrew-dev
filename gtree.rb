require "language/node"

class Gtree < Formula
  desc "C++ gtree library implementation"
  homepage "https://github.com/gulachek/gtree"
  url "https://github.com/gulachek/gtree/archive/master.tar.gz"
  version "0.1.0"
  sha256 ""
  license ""

  depends_on "node" => :build

  # could be :build if we allowed downloading runtime separately
  depends_on "cpplibroot-boost"

  def install
    # ENV.deparallelize
    Language::Node.setup_npm_environment

    system "npm", "install"

    build = (buildpath/"build")
    pack = (build/"com_gulachek_gtree.0.1.0")

    ENV["GULPACHEK_TARGET_PLATFORM"]="posix"
    ENV["GULPACHEK_TARGET_INCLUDE_DIR"]=include
    ENV["GULPACHEK_TARGET_LIB_DIR"]=lib

    ENV["GULPACHEK_BUILD_TYPE"]="release"
    ENV["GULPACHEK_BUILD_DIR"]=build

    ENV["CPP_LIBROOT_PATH"]="#{HOMEBREW_PREFIX}/share/cpplibroot"

    system "node", "build.js", "pack"
    
    # Install libraries
    lib.install (pack/"libcom_gulachek_gtree.0.dylib")
    (include/"gulachek").install (pack/"include/gulachek").children
    (share/"cpplibroot").install (pack/"com.gulachek.gtree")
  end

  test do
    #ENV["GULPACHEK_BUILD_TYPE"]="release"
    #ENV["GULPACHEK_BUILD_DIR"]=build.realpath
    #system "npx", "gulp", "test"
    true
  end
end
