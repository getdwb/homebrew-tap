cask "dwb-desktop" do
  version :latest
  sha256 :no_check

  homepage "https://getdwb.com/"
  name "DWB Desktop"
  desc "Manage dwb-bridge agent sessions from your menu bar"

  on_arm do
    url "https://getdwb.com/app/download/dwb-desktop-arm64.dmg",
        verified: "getdwb.com/"
  end
  on_intel do
    url "https://getdwb.com/app/download/dwb-desktop-x64.dmg",
        verified: "getdwb.com/"
  end

  app "DWB.app"
end
