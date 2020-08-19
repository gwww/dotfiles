#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

#
# ForkLift: Use ForkLift as default file explorer where possible
#
defaults write -g NSFileViewer -string com.binarynights.ForkLift-3
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
  '{LSHandlerContentType="public.folder";LSHandlerRoleAll="com.binarynights.ForkLift-3";}'

#
# Finder defaults
#
defaults write com.apple.Finder FXPreferredViewStyle Nlsv         # Use list view
defaults write com.apple.finder ShowPathbar -bool true            # Show Path bar in Finder
defaults write com.apple.finder QLEnableTextSelection -bool true  # Allow text selection in Quick Look
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # Disable .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
#
# Dock defaults
#
defaults write com.apple.dock orientation -string left      # Position dock on left of screen
defaults write com.apple.dock static-only -bool true        # Only show active applications
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock mru-spaces -bool false        # Don’t automatically rearrange Spaces based on most recent use

#
# Dialogs, UI, Defaults...
#
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true    # Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true       # Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true   # Quit printer app when printing is complete
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"             # Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#
# Trackpad, mouse, keyboard, Bluetooth accessories, display
#
defaults write -g NSOverlayScrollerHideDelay -float 5       # Autohide scrollbar timeout
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3    # Keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write -g com.apple.trackpad.scaling 2              # Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.mouse.scaling 2.5
defaults write NSGlobalDomain InitialKeyRepeat -int 15      # Set a really fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1              # Set a really fast key repeat
defaults write com.apple.BluetoothAudioAgent \
  "Apple Bitpool Min (editable)" -int 40                    # Set bluetooth audio quality so that it does not skip
defaults write com.apple.BezelServices kDimTime -int 300    # Turn off keyboard lights when not touched for 5 minutes
defaults write NSGlobalDomain AppleFontSmoothing -int 2     # Enabling subpixel font rendering on non-Apple LCDs

#
# Screen Capture
#
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png" # Other options: BMP, GIF, JPG, PDF, TIFF

#
# System
#
sudo systemsetup -settimezone "America/Toronto" > /dev/null

# Show the ~/Library folder.
chflags nohidden ~/Library
#chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
