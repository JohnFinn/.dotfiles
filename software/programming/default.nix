{pkgs, ...}: {
  imports = [
    # ./rust.nix
    ./docker.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.jdk
    jetbrains.rust-rover
    jetbrains.phpstorm
    jetbrains.idea-ultimate
    jetbrains.datagrip

    android-studio

    neovim
    zed-editor

    gitFull
    git-blame-someone-else
    just
    zoxide
    pre-commit
    unzip
    zip
    ripgrep
    wakatime

    jdk21
    bun
    nodejs_20
    nodePackages.pnpm
  ];
}
