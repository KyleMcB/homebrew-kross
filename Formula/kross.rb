class Kross < Formula
  desc "Kross shell"
  homepage "https://github.com/KyleMcB/kross"
  url "https://github.com/KyleMcB/kross/releases/download/v0.1.0-alpha/kross.zip"
  sha256 "e28835535d9800b07c53c646ef175edbfe529a32224019172bbd55180b36748"
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
