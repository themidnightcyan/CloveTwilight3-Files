#!/bin/bash

# Directory to install fonts
FONT_DIR="$HOME/.local/share/fonts/nerd-fonts"
mkdir -p "$FONT_DIR"
cd "$FONT_DIR" || exit

# Base URL for v3.4.0 release assets
BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0"

# Array of all font .zip files in v3.4.0 release
FONTS=(
0xProto.zip
3270.zip
AdwaitaMono.zip
Agave.zip
AnonymousPro.zip
Arimo.zip
AtkinsonHyperlegibleMono.zip
AurulentSansMono.zip
BigBlueTerminal.zip
BitstreamVeraSansMono.zip
CascadiaCode.zip
CascadiaMono.zip
CodeNewRoman.zip
ComicShannsMono.zip
CommitMono.zip
Cousine.zip
D2Coding.zip
DaddyTimeMono.zip
DejaVuSansMono.zip
DepartureMono.zip
DroidSansMono.zip
EnvyCodeR.zip
FantasqueSansMono.zip
FiraCode.zip
FiraMono.zip
GeistMono.zip
Go-Mono.zip
Gohu.zip
Hack.zip
Hasklig.zip
HeavyData.zip
Hermit.zip
iA-Writer.zip
IBMPlexMono.zip
Inconsolata.zip
InconsolataGo.zip
InconsolataLGC.zip
IntelOneMono.zip
Iosevka.zip
IosevkaTerm.zip
IosevkaTermSlab.zip
JetBrainsMono.zip
Lekton.zip
LiberationMono.zip
Lilex.zip
MartianMono.zip
Meslo.zip
Monaspace.zip
Monofur.zip
Monoid.zip
Mononoki.zip
MPlus.zip
NerdFontsSymbolsOnly.zip
Noto.zip
OpenDyslexic.zip
Overpass.zip
ProFont.zip
ProggyClean.zip
Recursive.zip
RobotoMono.zip
ShareTechMono.zip
SourceCodePro.zip
SpaceMono.zip
Terminus.zip
Tinos.zip
Ubuntu.zip
UbuntuMono.zip
UbuntuSans.zip
VictorMono.zip
ZedMono.zip
)

# Download, unzip, and clean up each font
for FONT in "${FONTS[@]}"; do
    echo "Downloading $FONT..."
    wget -q --show-progress "$BASE_URL/$FONT"
    echo "Extracting $FONT..."
    unzip -o "$FONT" -d "$FONT_DIR"
    rm "$FONT"
done

# Rebuild font cache
echo "Refreshing font cache..."
fc-cache -fv

echo "All Nerd Fonts installed!"
