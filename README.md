# mroboff/homebrew-tap

Homebrew formulae for [vm-curator](https://github.com/mroboff/vm-curator),
a TUI for creating and managing QEMU/KVM virtual machines.

Intended for Linux users on systems where Homebrew is the preferred package
manager — e.g. atomic/immutable distros like Bluefin, Silverblue, or Kinoite.

## Install

```sh
brew install mroboff/tap/vm-curator
```

QEMU itself is not bundled; install it from your distribution or with
`brew install qemu`. See `brew info vm-curator` for runtime notes.

## Platforms

- Linux x86_64 (prebuilt binary from the GitHub release)
- macOS: planned — will be added when vm-curator ships macOS builds

Formula versions are bumped automatically by vm-curator's release workflow.
