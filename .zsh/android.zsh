##############################################################################
# Android
##############################################################################
export ANDROID_HOME="$HOME/Library/Android/sdk"
# Setting ANDROID_SDK for android-sdk
export ANDROID_SDK="/Users/$(whoami)/Library/Android/sdk"
# Setting PATH to ANDROID_SDK emulator
export PATH="$PATH:${ANDROID_SDK}/emulator"
# Setting PATH to ANDROID_SDK platform tools
export PATH="$PATH:${ANDROID_SDK}/platform-tools"