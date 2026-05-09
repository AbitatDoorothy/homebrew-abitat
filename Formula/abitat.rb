class Abitat < Formula
  desc "Remote Codex control from Mac and iPhone"
  homepage "https://workspace.abitat.io"
  url "https://registry.npmjs.org/@abitat_reece/cli/-/cli-0.1.4.tgz"
  sha256 "69f2d7f044783c38281bf709d3cf164dbd1e267f0492a4695a284cc3b4a3a46a"

  depends_on "python" => :build
  depends_on "node@22"

  def install
    system Formula["node@22"].opt_bin/"npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/abitat"
  end

  test do
    assert_match "Usage: abitat", shell_output("#{bin}/abitat help")
    assert_match "Not logged in. Run `abitat login`.", shell_output("#{bin}/abitat doctor")
  end
end
