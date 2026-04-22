class Shed < Formula
  desc "Ephemeral Python workspaces powered by uv"
  homepage "https://github.com/jedrzej-grabski/shed"
  url "https://github.com/jedrzej-grabski/shed/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "0abf746e60a3d5010a24858c4229568dd00dd37103f80be09131900ebd36c36c"
  license "MIT"

  depends_on "uv"

  def install
  (lib/"shed").install "shed.sh"
  bin.install "bin/shed"
  end

  def caveats
    <<~EOS
      Run `shed` once to auto-configure your shell.
      Or add manually to ~/.zshrc:

        eval "$(shed --init)"
    EOS
  end

  test do
    assert_match "shed", shell_output("bash -c 'source #{lib}/shed/shed.sh && shed --help'")
  end
end
