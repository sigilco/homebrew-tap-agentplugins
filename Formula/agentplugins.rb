class Agentplugins < Formula
  desc "Write AI agent plugins once, ship to any harness"
  homepage "https://github.com/sigilco/agentplugins"
  version "${VERSION}"

  on_macos do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/${TAG}/agentplugins-aarch64-apple-darwin.tar.gz"
      sha256 "${SHA256_DARWIN_ARM64}"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/${TAG}/agentplugins-x86_64-apple-darwin.tar.gz"
      sha256 "${SHA256_DARWIN_X64}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sigilco/agentplugins/releases/download/${TAG}/agentplugins-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "${SHA256_LINUX_ARM64}"
    end
    on_intel do
      url "https://github.com/sigilco/agentplugins/releases/download/${TAG}/agentplugins-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "${SHA256_LINUX_X64}"
    end
  end

  def install
    bin.install "agentplugins-aarch64-apple-darwin" => "agentplugins" if Hardware::CPU.arm? && OS.mac?
    bin.install "agentplugins-x86_64-apple-darwin" => "agentplugins" if Hardware::CPU.intel? && OS.mac?
    bin.install "agentplugins-aarch64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.arm? && OS.linux?
    bin.install "agentplugins-x86_64-unknown-linux-gnu" => "agentplugins" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    assert_match "${VERSION}", shell_output("#{bin}/agentplugins --version")
    assert_match "Usage", shell_output("#{bin}/agentplugins --help")
  end
end
