class Nohead < Formula
  desc "Command-line interface for Nohead"
  homepage "https://nohead.io"
  url "https://registry.npmjs.org/@nohead/cli/-/cli-0.10.0.tgz"
  sha256 "5e882f22f4ace5159b7e553dd0727098092d7f7357d36d00f7f7669cf34117f6"
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
