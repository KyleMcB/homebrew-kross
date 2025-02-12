class Kross < Formula
  desc "Kross shell"
  homepage "https://github.com/KyleMcB/kross"
  url "https://github.com/KyleMcB/kross/releases/download/v0.1.6.1/kross.zip"
  sha256 "731c8f6b556f8d68a4264bf4ef3cbcb5be196a3be8aae35a180f4a8cd4f3ba32"
  license "MIT"

  depends_on "openjdk" # Ensure Java is installed
  depends_on "fzf"     # Ensure fzf is installed

  def install
    # Install the entire zip structure into libexec
    libexec.install Dir["*"]

    # Symlink the existing wrapper script into Homebrew's bin directory
    bin.install_symlink libexec/"bin/kross"
  end

  test do
    # Launch the shell and verify it works
    assert_match "Kross", shell_output("#{bin}/kross", 0)
  end
end
