class Nohead < Formula
  desc "Command-line interface for Nohead"
  homepage "https://nohead.io"
  url "https://registry.npmjs.org/@nohead/cli/-/cli-0.9.0.tgz"
  sha256 "b944cefede1987deedd7fefcb82abee3b89ce03321c56f479398ae036993daf3"
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
