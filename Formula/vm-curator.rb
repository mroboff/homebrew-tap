class VmCurator < Formula
  desc "TUI for creating and managing QEMU/KVM virtual machines"
  homepage "https://github.com/mroboff/vm-curator"
  # Prebuilt release binary (built on ubuntu-22.04; needs only glibc >= 2.34
  # and libudev.so.1, present on any systemd-based distro).
  url "https://github.com/mroboff/vm-curator/releases/download/v1.4.0/vm-curator-v1.4.0-linux-x86_64.tar.gz"
  sha256 "783e94d992029c56eb340f4fd43536441e441bb5bd6076b325eef75e44a339b7"
  version "1.4.0"
  license "MIT"

  # macOS support is planned upstream. When macOS release assets exist,
  # restructure to on_macos/on_linux blocks (each with url + sha256) and drop
  # these gates.
  depends_on :linux
  depends_on arch: :x86_64

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
