# getdwb/tap

Homebrew tap for [dwb-bridge](https://getdwb.com/) — **let cloud coding agents (Claude Code, Codex, ChatGPT) work on your own machines.**

## Install the macOS desktop app

```sh
brew tap getdwb/tap
brew trust getdwb/tap
brew install --cask getdwb/tap/dwb-desktop
```

## Or install dwb-host on any Linux machine / Raspberry Pi / router

```sh
curl -fsSL https://getdwb.com/install.sh | sh
```

Nix: `nix run github:getdwb/homebrew-tap#dwb-host` · AUR package coming soon.

Docs and case posts: https://getdwb.com/ · https://getdwb.com/blog/
