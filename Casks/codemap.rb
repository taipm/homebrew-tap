cask "codemap" do
  version "0.0.1-alpha.23"
  sha256 "71617f96c716c73f73b66aab66d17857189b6f15c985ca402ad1c58c84338da3"

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
