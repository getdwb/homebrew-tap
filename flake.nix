{
  description = "dwb-host: local executor for dwb-bridge";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      maps = {
        "x86_64-linux"   = { url = "dwb-host-Linux-x86_64";  sha = "86b3f7662ba9adadc71936bfa42890fcb17d41f28444b98831445d7485e6e59f"; };
        "aarch64-linux"  = { url = "dwb-host-Linux-aarch64"; sha = "0fd8101e02f6f8cc92fc38e524bf19cb4b786fd997cb4fef9b2a366c72a39d2a"; };
        "x86_64-darwin"  = { url = "dwb-host-Darwin-x86_64"; sha = "b1d5e4412a77bc6b39b724790ca618df552f9b64aa0cf9b828f168c6a8ae0666"; };
        "aarch64-darwin" = { url = "dwb-host-Darwin-arm64";  sha = "6bc3bf8a454f3dfa4390ad283111551db3d80d71d9a3babfadf3872bb0b762bc"; };
      };
      pkg = system: pkgs:
        if maps ? system then pkgs.stdenv.mkDerivation {
          pname = "dwb-host";
          version = "2026.11.20";
          src = pkgs.fetchurl {
            url = "https://getdwb.com/dl/${maps.${system}.url}";
            sha256 = maps.${system}.sha;
          };
          sourceRoot = ".";
          dontUnpack = true;
          installPhase = "install -Dm755 $src $out/bin/dwb-host";
        } else throw "unsupported system: ${system}";
    in {
      packages = builtins.listToAttrs (map
        (system: { name = system; value = pkg system nixpkgs.legacyPackages.${system}; })
        systems);
      packages.x86_64-linux.default = self.packages.x86_64-linux.x86_64-linux;
      packages.aarch64-linux.default = self.packages.aarch64-linux.aarch64-linux;
      packages.x86_64-darwin.default = self.packages.x86_64-darwin.x86_64-darwin;
      packages.aarch64-darwin.default = self.packages.aarch64-darwin.aarch64-darwin;
    };
}
