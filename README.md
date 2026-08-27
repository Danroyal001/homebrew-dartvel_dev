# Dartvel Homebrew tap

```sh
brew install Danroyal001/dartvel_dev/dartvel_dev
dartvel --help
```

The formula, the [pub.dev package](https://pub.dev/packages/dartvel_dev) and
the [npm package](https://www.npmjs.com/package/dartvel_dev) are all named
`dartvel_dev`. The command is `dartvel`.

Those differ on purpose. `dartvel` on pub.dev was taken on 2026-08-06 by an
unrelated package, so the published identifier carries a suffix while the thing
you type does not.

## What it installs

A prebuilt, self-contained `dartvel` binary. The CLI is a Dart program, but
`dart build cli` links the Dart runtime and the Rust server library into one
executable, so the formula has no dependencies at all -- no Dart, no Flutter.

Building an application still needs Flutter, for whichever target you are
building. Running the CLI does not.
