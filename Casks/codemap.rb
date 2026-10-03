cask "codemap" do
  version "0.0.1-alpha.24"
  sha256 "b815c2c730702b446e9ab3b62f1d2b09665ed4f66d6a58bcaafd704c6197061d"

  url "https://github.com/taipm/homebrew-tap/releases/download/v#{version}/codemap-#{version}-macos-universal.tar.gz"
  name "codemap"
  desc "Call-graph code intelligence (Rust, Python) as an MCP server for AI agents"
  homepage "https://github.com/taipm/homebrew-tap"

  binary "codemap"
  binary "codemap-mcp-server"

  caveats <<~CAVEATS
    Register the MCP server in Claude Code:  codemap setup
    Upgrade later:                           codemap update
  CAVEATS
end
