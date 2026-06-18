# homebrew-bitlocker-automount

Homebrew tap for [**bitlocker-automount**](https://github.com/raviunukuru/bitlocker-automount) — open BitLocker drives read-only in Finder on Apple Silicon Macs, automatically, with no kernel extension.

## Install

```bash
brew tap raviunukuru/bitlocker-automount
brew install bitlocker-automount
bitlocker-automount install
```

(Requires [anylinuxfs](https://github.com/nohajc/anylinuxfs): `brew tap nohajc/anylinuxfs && brew trust nohajc/anylinuxfs && brew install anylinuxfs && anylinuxfs init`.)

## Maintainer: cutting a release

The formula's `sha256` must match the release tarball. After tagging the main repo:

```bash
# in the bitlocker-automount repo
git tag v0.1.0 && git push origin v0.1.0

# get the tarball sha256
curl -sL https://github.com/raviunukuru/bitlocker-automount/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256

# paste it into Formula/bitlocker-automount.rb (replace REPLACE_WITH_RELEASE_TARBALL_SHA256), commit, push this tap
brew install --build-from-source raviunukuru/bitlocker-automount/bitlocker-automount   # local test
```
