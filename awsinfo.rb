class Awsinfo < Formula
    desc "get AWS info using simple search terms"
    homepage "https://github.com/carterjones/awsinfo"
    url "https://github.com/carterjones/awsinfo/archive/v0.0.1.tar.gz"
    sha256 "5e89543aaddefa0cc4445225bd542b4a9be76e1a2733c6a2789c2df4d54e3dcf"

    depends_on "go" => :build

    def install
        system "go", "build", "-mod=vendor", "-o", bin/"awsinfo", "./cmd/awsinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"elbinfo", "./cmd/elbinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"instanceinfo", "./cmd/instanceinfo/"
        system "go", "build", "-mod=vendor", "-o", bin/"r53info", "./cmd/r53info/"
    end

    test do
        assert_match /usage: awsinfo/, shell_output("#{bin}/awsinfo")
        assert_match /usage: elbinfo/, shell_output("#{bin}/elbinfo")
        assert_match /usage: instanceinfo/, shell_output("#{bin}/instanceinfo")
        assert_match /usage: r53info/, shell_output("#{bin}/r53info")
    end
  end
