class Playit < Formula
  desc "playit.gg tunnel client - expose self-hosted game servers to the internet"
  homepage "https://playit.gg"
  url "https://github.com/playit-cloud/playit-agent/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "caa1510cc71fc0ea1bf1cd3763c9e136f8d3aa81f5c26f0145a5000d401d4cf5"
  license "BSL-1.1"
  version "1.2.0"

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
