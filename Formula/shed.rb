class Shed < Formula
  desc "Ephemeral Python workspaces powered by uv"
  homepage "https://github.com/jedrzej-grabski/shed"
  url "https://github.com/jedrzej-grabski/shed/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ee60682906cec8ddb5f8d0c8f9f5f13d790fab078e634409664a3b2234f97c8a"
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
