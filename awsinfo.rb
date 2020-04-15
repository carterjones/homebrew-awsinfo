class Awsinfo < Formula
    desc "get AWS info using simple search terms"
    homepage "https://github.com/carterjones/awsinfo"
    url "https://github.com/carterjones/awsinfo/archive/v0.0.2.tar.gz"
    sha256 "774939d92b16bf1a9600e275e7a38f5623aa3489a62120fd9137a197ed954401"

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
