# Homebrew tap for Oval

Formulae for [Oval](https://oval.vote), the plain-text format for voting guides.

```sh
brew install oval-vote/tap/oval
```

Or tap once and install by name:

```sh
brew tap oval-vote/tap
brew install oval
```

`oval` is the command line tool from the [reference implementation](https://github.com/oval-vote/oval):
`oval check`, `oval compile`, and `oval fmt`. The formula installs a prebuilt binary for macOS and
Linux on Apple silicon, Intel, and arm64.

The formula is written by the implementation's release workflow on every release, so nothing here is
edited by hand.
