# Nohead Homebrew tap

The [Nohead CLI](https://github.com/nohead-io/nohead-cli) for [Homebrew](https://brew.sh):

```bash
brew install nohead-io/tap/nohead
```

`brew upgrade nohead` moves it to the latest release. The [CLI docs](https://docs.nohead.io/cli/overview) cover what it does.

## Releasing

The formula installs `@nohead/cli` from npm. Once a CLI release is installable there, point the formula at it:

```bash
version=1.2.3
url="https://registry.npmjs.org/@nohead/cli/-/cli-$version.tgz"
sha=$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)
sed -i '' -e "s|^  url .*|  url \"$url\"|" -e "s|^  sha256 .*|  sha256 \"$sha\"|" Formula/nohead.rb
```

Commit it, check the commit (`brew tap` takes this checkout's commits, not its uncommitted changes), then push to `main`:

```bash
brew install --build-from-source nohead-io/tap/nohead && brew test nohead && brew audit --strict nohead
```
