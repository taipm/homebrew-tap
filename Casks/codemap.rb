cask "codemap" do
  version "0.0.1-alpha.19"
  sha256 "cfa93aacc9d9081c764fff1864c94302d3839c9056a6b9b0de146969dbf51bd5"

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
