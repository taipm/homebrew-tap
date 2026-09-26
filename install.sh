#!/bin/sh
# First-time install of codemap without Homebrew: signed + notarized macOS binaries from the
# GitHub tap release -> ~/.local/bin, then `codemap setup` (registers the MCP server in Claude Code).
#   curl -fsSL https://raw.githubusercontent.com/taipm/homebrew-tap/main/install.sh | sh
# Published to the tap as install.sh by scripts/release-brew.sh; `codemap update` re-runs it.
# Env: CODEMAP_BIN_DIR (default ~/.local/bin), CODEMAP_VERSION (tag, default newest release).
set -eu
repo="taipm/homebrew-tap"
team="63G7C3TV59"
bin="${CODEMAP_BIN_DIR:-$HOME/.local/bin}"
die() { echo "codemap: $*" >&2; exit 1; }
[ "$(uname -s)" = Darwin ] || die "only macOS builds are published for now"

tag="${CODEMAP_VERSION:-$(curl -fsSL "https://api.github.com/repos/$repo/releases?per_page=1" |
  sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | head -1)}"
[ -n "$tag" ] || die "could not find a release of $repo"
ver="${tag#v}"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
echo "codemap: downloading ${ver}..."
curl -fsSL "https://github.com/$repo/releases/download/$tag/codemap-$ver-macos-universal.tar.gz" |
  tar -xz -C "$tmp"
for b in codemap codemap-mcp-server; do
  codesign --verify --strict "$tmp/$b" 2>/dev/null &&
    codesign -dv "$tmp/$b" 2>&1 | grep -q "TeamIdentifier=$team" ||
    die "$b is not signed by team $team — refusing to install"
done

mkdir -p "$bin"
for b in codemap codemap-mcp-server; do
  install -m 0755 "$tmp/$b" "$bin/$b.new" && mv "$bin/$b.new" "$bin/$b"
done
echo "codemap: installed $ver -> $bin"
case ":$PATH:" in
  *":$bin:"*) ;;
  *) echo "codemap: add $bin to PATH, e.g. echo 'export PATH=\"$bin:\$PATH\"' >> ~/.zshrc" ;;
esac
"$bin/codemap" setup || echo "codemap: run '$bin/codemap setup' once Claude Code is installed"
