class Playit < Formula
  desc "playit.gg tunnel client - expose self-hosted game servers to the internet"
  homepage "https://playit.gg"
  url "https://github.com/playit-cloud/playit-agent/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "52b431a861c143f3fc78bfce8d7d5862bf865bc88da584cafb62a5fec39c0df4"
  license "BSL-1.1"
  version "1.0.10"

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
