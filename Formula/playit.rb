class Playit < Formula
  desc "playit.gg tunnel client - expose self-hosted game servers to the internet"
  homepage "https://playit.gg"
  url "https://github.com/playit-cloud/playit-agent/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "19f796aa59a9f5c4691b05b62c565df99ac9479a55a381040742d975981409a9"
  license "BSL-1.1"
  version "2.0.2"

  head "https://github.com/playit-cloud/playit-agent.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(root: prefix, path: "packages/playit-cli")
    system "cargo", "install", *std_cargo_args(root: prefix, path: "packages/playitd")
    # Create a convenience alias so both `playit` and `playit-cli` work
    bin.install_symlink bin/"playit-cli" => "playit" if (bin/"playit-cli").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playit-cli version")
  end
end
