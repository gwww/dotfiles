#!/usr/bin/env bash

defaults write -g NSFileViewer -string com.binarynights.ForkLift-3
# defaults delete -g NSFileViewer

# only show active applications 
defaults write com.apple.dock static-only -bool TRUE

# position dock on left of screen
defaults write com.apple.dock orientation -string left

# Quit printer app when printing is complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Autohide scrollbar timeout
defaults write -g NSOverlayScrollerHideDelay -float 5

# This setting will turn off the keyboard lights when the keyboard is not touched for five minutes. 
defaults write com.apple.BezelServices kDimTime -int 300

# Preview Window enable copy text 
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable .DS_Store files on Network Volumes Windows 
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Enabling subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Always open everything in Finder's list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

echo "Setting system timezone..."
sudo systemsetup -settimezone "America/Toronto" > /dev/null

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Set iterm hotkey windows length of animation
defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration -float 0.15

# Set bluetooth audio quality so that it does not skip
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
