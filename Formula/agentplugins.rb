class Agentplugins < Formula
  desc "Write AI agent plugins once, ship to any harness"
  homepage "https://github.com/sigilco/agentplugins"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.3.0/agentplugins-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_ARM64_DARWIN_SHA256"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.3.0/agentplugins-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_X64_DARWIN_SHA256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.3.0/agentplugins-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_ARM64_LINUX_SHA256"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/v0.3.0/agentplugins-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_X64_LINUX_SHA256"
    end
  end

  def install
    bin.install "agentplugins-aarch64-apple-darwin" => "agentplugins" if Hardware::CPU.arm? && OS.mac?
    bin.install "agentplugins-x86_64-apple-darwin" => "agentplugins" if Hardware::CPU.intel? && OS.mac?
    bin.install "agentplugins-aarch64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.arm? && OS.linux?
    bin.install "agentplugins-x86_64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/agentplugins --version")
    assert_match "Usage", shell_output("#{bin}/agentplugins --help")
  end
end
