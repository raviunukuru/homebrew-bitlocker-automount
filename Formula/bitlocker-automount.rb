class BitlockerAutomount < Formula
  desc "Auto-mount BitLocker drives read-only on macOS — GUI, no kernel extension"
  homepage "https://github.com/raviunukuru/bitlocker-automount"
  url "https://github.com/raviunukuru/bitlocker-automount/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "90734f0494a262edaf3941b0ba314264ac2d5f9e9cbc07fa48746da8ef2103ea"
  license "MIT"
  version "0.1.0"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "nohajc/anylinuxfs/anylinuxfs"

  def install
    libexec.install "src/watcher.sh", "src/unlock-gui.sh", "src/bitlocker-ro-mount"
    bin.install "bin/bitlocker-automount"
  end

  def caveats
    <<~EOS
      Enable auto-mount on plug-in (asks for your Mac password once):
        bitlocker-automount install

      Make sure the engine is initialized once:
        anylinuxfs init

      Then just plug in a BitLocker drive — a password box appears and the drive
      mounts READ-ONLY in Finder. Remove everything with:
        bitlocker-automount uninstall
    EOS
  end

  test do
    assert_match "bitlocker-automount #{version}", shell_output("#{bin}/bitlocker-automount version")
  end
end
