cask "codemap" do
  version "0.0.1-alpha.3"
  sha256 "d3758e721c0fc12c2a62f4eb07e5414f00dc2a46c10ac3c3122f3de8b6251e32"

  url "https://github.com/taipm/homebrew-tap/releases/download/v#{version}/codemap-#{version}-macos-universal.tar.gz"
  name "codemap"
  desc "Call-graph code intelligence (Rust, Python) as an MCP server for AI agents"
  homepage "https://github.com/taipm/homebrew-tap"

  binary "codemap"
  binary "codemap-mcp-server"

  # Binaries are not notarized; drop the download quarantine so Gatekeeper lets them run.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s]
  end

  caveats <<~CAVEATS
    Register the MCP server in Claude Code:  codemap setup
    Upgrade later:                           codemap update
  CAVEATS
end
