class VmCurator < Formula
  desc "TUI for creating and managing QEMU/KVM virtual machines"
  homepage "https://github.com/mroboff/vm-curator"
  version "1.3.0"
  license "MIT"

  # Installs the prebuilt release binary (built on ubuntu-22.04; needs only
  # glibc >= 2.34 and libudev.so.1, present on any systemd-based distro).
  #
  # macOS support is planned upstream; when release assets exist, add an
  # on_macos block here and drop the two depends_on lines below.
  depends_on :linux
  depends_on arch: :x86_64

  on_linux do
    on_intel do
      url "https://github.com/mroboff/vm-curator/releases/download/v1.3.0/vm-curator-v1.3.0-linux-x86_64.tar.gz"
      sha256 "c793d836b984d9f8b72e8a4731c4bc21311c2b6c5200aadb688e8856d3b080b3"
    end
  end

  def install
    bin.install "vm-curator"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      vm-curator drives QEMU, which is not installed by this formula.
      Install it from your distribution, or with:
        brew install qemu

      Runtime notes:
        - qemu-system-* and qemu-img must be on PATH
        - hardware acceleration needs membership in the "kvm" group:
            sudo usermod -aG kvm $USER   # then log out and back in
        - UEFI guests (e.g. Windows 11) need OVMF/edk2 firmware
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vm-curator --version")
  end
end
