class Awsinfo < Formula
    desc "get AWS info using simple search terms"
    homepage "https://github.com/carterjones/awsinfo"
    url "https://github.com/carterjones/awsinfo/archive/v0.0.4.tar.gz"
    sha256 "4de2d772fb03530566f8f2caa9ebd337ac54cec630f3396bea26f6f33d3039ce"

    depends_on "go" => :build

    def install
        system "go", "build", "-mod=vendor", "-o", bin/"awsinfo", "./cmd/awsinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"elbinfo", "./cmd/elbinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"instanceinfo", "./cmd/instanceinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"r53info", "./cmd/r53info/"
    end

    test do
        assert_match /usage:/, shell_output("#{bin}/awsinfo")
        assert_match /usage:/, shell_output("#{bin}/elbinfo")
        assert_match /usage:/, shell_output("#{bin}/instanceinfo")
        assert_match /usage:/, shell_output("#{bin}/r53info")
    end
  end
