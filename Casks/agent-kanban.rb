cask "agent-kanban" do
  version "0.0.1-alpha.11"
  sha256 "23690349f90dbe5d6a14918b0dde118088768f1d56444ce07c1322f9d18196dc"

  url "https://github.com/taipm/agent-kanban-releases/releases/download/v#{version}/agent-kanban-#{version}-macos-universal.tar.gz"
  name "agent-kanban"
  desc "Cross-project shared kanban board as an MCP server for AI agents"
  homepage "https://github.com/taipm/agent-kanban-releases"

  binary "agent-kanban-mcp-server"

  caveats <<~CAVEATS
    Upgrade later: agent-kanban-mcp-server update
  CAVEATS
end
