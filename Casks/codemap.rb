cask "codemap" do
  version "0.0.1-alpha.26"
  sha256 "c9284d71170f597c2d2ec3887e8ea878ec3f608f157243a5e0fc8e039b4d4427"

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
