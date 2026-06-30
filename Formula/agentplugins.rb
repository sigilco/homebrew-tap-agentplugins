class Agentplugins < Formula
  desc "Write AI agent plugins once, ship to any harness"
  homepage "https://github.com/sigilco/agentplugins"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.6.0/agentplugins-aarch64-apple-darwin.tar.gz"
      sha256 "1d0793aebd2829f6e8775066f11fa05c1092b2ab95d8ab222ac53570c2470940"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.6.0/agentplugins-x86_64-apple-darwin.tar.gz"
      sha256 "3fc77da12072cf9fe216d11904485a5debaf2e817da864c4f03ff243b319ed23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.6.0/agentplugins-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0542a6c53495a7a91dd8c9d500c094177029ddaff12fe55c509bafd923e8542"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.6.0/agentplugins-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b00518c2ef446f6c0eb126e5c72089a1b161085149496d5c22b8530dc0cdc9ea"
    end
  end

  def install
    bin.install "agentplugins-aarch64-apple-darwin" => "agentplugins" if Hardware::CPU.arm? && OS.mac?
    bin.install "agentplugins-x86_64-apple-darwin" => "agentplugins" if Hardware::CPU.intel? && OS.mac?
    bin.install "agentplugins-aarch64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.arm? && OS.linux?
    bin.install "agentplugins-x86_64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/agentplugins --version")
    assert_match "Usage", shell_output("#{bin}/agentplugins --help")
  end
end
