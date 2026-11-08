class Oval < Formula
  desc "Command-line tools for the Oval voting guide format"
  homepage "https://oval.vote"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.9/oval-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "205a50dcc93c946b5e8aa3eb332aceb489aacb25ad4e9edda26089def9665a20"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.9/oval-0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "4810a95ab5eae8d3d278091c8b8b7119c792d51e047c69fac45aed3334eabb28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.9/oval-0.1.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3cb3312aa420a9918b0bae847d30b1e508789c1073b6f4d1746c71f927443641"
    end
    on_intel do
      url "https://github.com/oval-vote/oval/releases/download/v0.1.9/oval-0.1.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8aff349a076d9932eb6a5eb1434836dfd8f39566b7b79876a0e1a85bef9a9cd8"
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
