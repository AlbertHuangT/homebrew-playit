class Playit < Formula
  desc "playit.gg tunnel client - expose self-hosted game servers to the internet"
  homepage "https://playit.gg"
  url "https://github.com/playit-cloud/playit-agent/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "c2e7c8252425c2f04e5cba2bc209b48d12675740df0448bb03022ca3d3168fa4"
  license "BSL-1.1"
  version "1.0.5"

  head "https://github.com/playit-cloud/playit-agent.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(root: prefix, path: "packages/agent_cli")
    # Create a convenience alias so both `playit` and `playit-cli` work
    bin.install_symlink bin/"playit-cli" => "playit" if (bin/"playit-cli").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/playit-cli --version 2>&1", 1)
  end
end
