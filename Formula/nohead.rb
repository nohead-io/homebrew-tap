class Nohead < Formula
  desc "Command-line interface for Nohead"
  homepage "https://nohead.io"
  url "https://registry.npmjs.org/@nohead/cli/-/cli-0.12.0.tgz"
  sha256 "08a99497e081296090a81102e56d73e7f7b4035fe2d4645c752c0d03f56b08e6"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@nohead/cli/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nohead --version")
  end
end
