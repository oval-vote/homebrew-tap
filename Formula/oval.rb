class Oval < Formula
  desc "Command-line tools for the Oval voting guide format"
  homepage "https://oval.vote"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.10/oval-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "c99bf35c45b85b3b94a7d4005179e53f1364aa7f00b28fd8a0a38e962e7d5146"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.10/oval-0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "29557a7fd125477eb58fcab34dac4ba38657195073b4bd928963bd7ced381e72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.10/oval-0.1.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "30769c12edee818adfe5390507f569ad4ba6615a1bdd62425cd8f89f92464f1e"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.10/oval-0.1.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c179e9eec2437cc2678cc63458e0e29fba78a3c0a24ba0380b5f7ca222d16bbe"
    end
  end

  def install
    bin.install "oval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oval --version")
    (testpath/"guide.oval").write <<~OVAL
      oval 1
      guide "G"
      election "E"
      date 2026-11-03
      ballot @b "B"
        measure @m "M"
          recommend yes
    OVAL
    system bin/"oval", "check", testpath/"guide.oval"
  end
end
