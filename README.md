# homebrew-playit

Unofficial [Homebrew](https://brew.sh) tap for [playit-cli](https://github.com/playit-cloud/playit-agent) on macOS.

playit.gg lets you expose self-hosted game servers to the internet without port forwarding.

> **Note:** This is an unofficial tap. The official project does not provide macOS binaries,
> so this tap builds from source using the original open-source code.

## Install

```bash
brew tap AlbertHuangT/playit
brew install playit
```

First install will take a few minutes as it compiles Rust source code.

After install, both `playit` and `playit-cli` commands are available.

## Usage

```bash
# Interactive setup (first time)
playit

# Or use directly
playit-cli --help
```

See the [official docs](https://playit.gg/docs) for full usage instructions.

## Update

```bash
brew update
brew upgrade playit
```

## Requirements

- macOS (Apple Silicon or Intel)
- [Homebrew](https://brew.sh)
- Rust toolchain (installed automatically by Homebrew if missing)

## Version

Current formula tracks **v0.17.1** of [playit-cloud/playit-agent](https://github.com/playit-cloud/playit-agent).

## License

The playit-agent source code is licensed under [BSL-1.1](https://github.com/playit-cloud/playit-agent/blob/master/LICENSE.txt).
This tap repository itself is MIT licensed.
