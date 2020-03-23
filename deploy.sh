#!/bin/zsh

pathPrefix="/Users/$USER"
vscodePath="$pathPrefix/Library/Application Support/Code/User/"
macServicesPref="$pathPrefix/Library/Preferences/"
hammerspoonPath="$pathPrefix/.hammerspoon/"

# abs path of pwd
currentPath=$(dirname $0:A)

# Copy all the config files into the correct path
# except iTerm2 as the font and settings need to import/install and select manually
cp -r "$currentPath"/zsh/. $pathPrefix
cp -r "$currentPath"/vim/. $pathPrefix
cp -r "$currentPath"/hammerspoon/. $hammerspoonPath
cp -r "$currentPath"/macServicesPref/. $macServicesPref
cp -r "$currentPath"/vscode/*.json $vscodePath