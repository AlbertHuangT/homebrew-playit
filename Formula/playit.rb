class Playit < Formula
  desc "playit.gg tunnel client - expose self-hosted game servers to the internet"
  homepage "https://playit.gg"
  url "https://github.com/playit-cloud/playit-agent/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "11ebb1c80ff73412ee56ab52fcd6ac423dd31c7f0a218a08f6da4601e21c3991"
  license "BSL-1.1"
  version "1.1.0"

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
