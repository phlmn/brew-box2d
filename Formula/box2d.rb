class Box2d < Formula
    desc "2D physics engine for games"
    homepage "http://www.box2d.org/"
    url "https://github.com/erincatto/Box2D/archive/v2.3.1.tar.gz"
    sha256 "75d62738b13d2836cd56647581b6e574d4005a6e077ddefa5d727d445d649752"
    head "https://github.com/erincatto/Box2D.git"

    bottle do
      cellar :any
      sha256 "967e9f17c6133f253be1be4f845899160af7c8cc8d072e41b176d9c636911a19" => :el_capitan
      sha256 "1559be0d79e66e8074a051f36db5bbf21a9d556013803cce7e04184bd28028a9" => :yosemite
      sha256 "40effd7d4952d37d15e7b34da4b9c207956b1d79bdd856f9f03307ecf52a5b3f" => :mavericks
      sha256 "143949e28a0b74432015b56f6372682ce69cfb451ccd82a3f4b1fb1c69e24310" => :mountain_lion
    end

    depends_on "cmake" => :build

    def install
      cd "Box2D" do
        system "cmake", "-DBOX2D_INSTALL=ON",
                        "-DBOX2D_BUILD_SHARED=ON",
                        "-DBOX2D_BUILD_EXAMPLES=OFF",
                        *std_cmake_args
        system "make", "install"
      end
      libexec.install "Box2D/HelloWorld"
    end

    test do
      system ENV.cxx, "-L#{lib}", "-lbox2d",
             libexec/"HelloWorld/HelloWorld.cpp", "-o", testpath/"test"
      system "./test"
    end
  end
