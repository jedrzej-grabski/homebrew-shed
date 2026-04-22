class Shed < Formula
  desc "Ephemeral Python workspaces powered by uv"
  homepage "https://github.com/jedrzej-grabski/shed"
  url "https://github.com/jedrzej-grabski/shed/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0a4eb0165053850c40f6e19b5f0c7a442aa73b60450deebb20ce2b68bdee7a16"
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
