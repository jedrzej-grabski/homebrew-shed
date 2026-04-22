class Shed < Formula
  desc "Ephemeral Python workspaces powered by uv"
  homepage "https://github.com/jedrzej-grabski/shed"
  url "https://github.com/jedrzej-grabski/shed/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "ddb9d74a094d567eea47c33b1e612e8ec38e4eed4a555f320edaef204cc1fd0c"
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
