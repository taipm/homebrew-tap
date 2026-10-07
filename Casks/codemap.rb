cask "codemap" do
  version "0.0.1-alpha.27"
  sha256 "b957a0bb6bbc4340e3ab16fff68b1e7d9d7f8f7e88a9765ac7c05b34a2c6d72f"

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
