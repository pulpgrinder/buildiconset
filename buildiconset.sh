#!/bin/bash
#
# This script is expanded from an original that was:
# Copyright (C) 2014 Wenva <lvyexuwenfa100@126.com>
# 
# The original script only generated the icons that were needed
# for iOS circa 2014.
# Since then, the number of icons needed for iOS has 
# proliferated. The script now generates all resolutions 
# needed for iOS as of late 2021 plus a few extra resolutions, 
# for possible future use). It also generates the scads of files
# needed for an Android app.
#
# The modifications were written by Anthony W. Hursh,
# and are released under a license identical to the original, 
# which is as follows:
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e
SQUARE_FILE="$1"
CIRCULAR_FILE="$2"
DST_PATH="$3"

VERSION=2.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 squarefile circularfile dstpath

DESCRIPTION:
    This script makes generating iOS and Android app icons easier and simpler. You will need to install ImageMagick in order for it to work, if you don't already have it. If you're on a Mac with Homebrew installed, you can get ImageMagick by running:
    
    'brew install ImageMagick'
    
    from the terminal. If you're on other platforms, you're on your own. :-)
    
    The script generates 47 icon image files and 11 blank Android splash screens, starting with only two original files. Obviously the results may not be as good as individually hand-tuning each file, but the result is often quite acceptable. If nothing else, it provides a basis to get your app running for testing.
    
    The two files you need are:

    squarefile - A square png image with your app icon/logo. It
    should be at least 1024x1024 for good results, but I 
    recommend making it at least 4096x4096 if you can.
    
    circularfile - This is also a square png image, but one that has an inscribed circular region containing the important parts of the icon/logo. This is used to make circular buttons and icons for Android. 
    
    The final parameter is:
    
    dstpath - The destination path to put the generated images.

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>
    
MODIFICATIONS:
    Anthony W. Hursh <pulpgrinder@protonmail.com>

LICENSE:
    MIT license.

EXAMPLE:
    $0 1024-square.png 1024-circular.png ~/123
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 3 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

if [ ! -d "$DST_PATH/ios" ];then
    mkdir -p "$DST_PATH/ios"
fi

# Generate iOS icons, refer to:https://developer.apple.com/library/ios/qa/qa1686/_index.html

info 'Generating iOS icons'
info 'Generating 16 pixel icons...'
convert "$SQUARE_FILE" -resize 16x16 "$DST_PATH/ios/Icon-16.png"
convert "$SQUARE_FILE" -resize 32x32 "$DST_PATH/ios/Icon-16@2x.png"
info 'Generating 20 pixel icons...'
convert "$SQUARE_FILE" -resize 20x20 "$DST_PATH/ios/Icon-20.png"
convert "$SQUARE_FILE" -resize 40x40 "$DST_PATH/ios/Icon-20@2x.png"
convert "$SQUARE_FILE" -resize 60x60 "$DST_PATH/ios/Icon-20@3x.png"
info 'Generating 29 pixel icons...'
convert "$SQUARE_FILE" -resize 29x29 "$DST_PATH/ios/Icon-29.png"
convert "$SQUARE_FILE" -resize 58x58 "$DST_PATH/ios/Icon-29@2x.png"
convert "$SQUARE_FILE" -resize 87x87 "$DST_PATH/ios/Icon-29@3x.png"
info 'Generating 32 pixel icons...'
convert "$SQUARE_FILE" -resize 32x32 "$DST_PATH/ios/Icon-32.png"
convert "$SQUARE_FILE" -resize 64x64 "$DST_PATH/ios/Icon-32@2x.png"
info 'Generating 40 pixel icons...'
convert "$SQUARE_FILE" -resize 40x40 "$DST_PATH/ios/Icon-40.png"
convert "$SQUARE_FILE" -resize 80x80 "$DST_PATH/ios/Icon-40@2x.png"
convert "$SQUARE_FILE" -resize 120x120 "$DST_PATH/ios/Icon-40@3x.png"
info 'Generating Ad Hoc distribution icons...'
convert "$SQUARE_FILE" -resize 57x57 "$DST_PATH/ios/Icon-57x57.png"
convert "$SQUARE_FILE" -resize 512x512 "$DST_PATH/ios/Icon-512x512.png"
info 'Generating 60 pixel icons...'
convert "$SQUARE_FILE" -resize 60x60 "$DST_PATH/ios/Icon-60.png"
convert "$SQUARE_FILE" -resize 120x120 "$DST_PATH/ios/Icon-60@2x.png"
convert "$SQUARE_FILE" -resize 180x180 "$DST_PATH/ios/Icon-60@3x.png"
info 'Generating 76 pixel icons...'
convert "$SQUARE_FILE" -resize 76x76 "$DST_PATH/ios/Icon-76.png"
convert "$SQUARE_FILE" -resize 152x152 "$DST_PATH/ios/Icon-76@2x.png"
convert "$SQUARE_FILE" -resize 228x228 "$DST_PATH/ios/Icon-76@3x.png"
info 'Generating 83.5 pixel icon...'
convert "$SQUARE_FILE" -resize 167x167 "$DST_PATH/ios/Icon-835@2x.png"
info 'Generating 128 pixel icons...'
convert "$SQUARE_FILE" -resize 128x128 "$DST_PATH/ios/Icon-128.png"
convert "$SQUARE_FILE" -resize 256x256 "$DST_PATH/ios/Icon-128@2x.png"
info 'Generating 256 pixel icons...'
convert "$SQUARE_FILE" -resize 256x256 "$DST_PATH/ios/Icon-256.png"
convert "$SQUARE_FILE" -resize 512x512 "$DST_PATH/ios/Icon-256@2x.png"
info 'Generating 512 pixel icons...'
convert "$SQUARE_FILE" -resize 512x512 "$DST_PATH/ios/Icon-512.png"
cp "$DST_PATH/ios/Icon-512.png" "$DST_PATH/ios/AppStoreIcon.png"
convert "$SQUARE_FILE" -resize 1024x1024 "$DST_PATH/ios/Icon-512@2x.png"
info 'Generating 1024 pixel icons (for App Store)...'
convert "$SQUARE_FILE" -resize 1024x1024 "$DST_PATH/ios/Icon-1024.png"
convert "$SQUARE_FILE" -resize 2048x2048 "$DST_PATH/ios/Icon-1024@2x.png"

info 'generating Android Icons'

if [ ! -d "$DST_PATH/android" ];then
    mkdir -p "$DST_PATH/android/app/src/main/assets/public/assets/images"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-land-hdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-land-mdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-land-xhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-land-xxhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-land-xxxhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-port-hdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-port-mdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-port-xhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-port-xxhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/drawable-port-xxxhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/mipmap-hdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/mipmap-mdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/mipmap-xhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/mipmap-xxhdpi"
    mkdir -p "$DST_PATH/android/app/src/main/res/mipmap-xxxhdpi"
fi

info 'Generating logo...'
convert "$SQUARE_FILE" -resize 512x512 "$DST_PATH/android/app/src/main/assets/public/assets/images/logo.png"

info 'Generating splash screens...'
# Make blank gray splash screens.
convert  -size 430x320 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable/splash.png"
convert -size 800x480 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-land-hdpi/splash.png"
convert -size 480x320  canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-land-mdpi/splash.png"
convert -size 1280x720 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-land-xhdpi/splash.png"
convert -size 1600x960 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-land-xxhdpi/splash.png"
convert -size 1920x1280 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-land-xxxhdpi/splash.png"
convert -size 480x800 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-port-hdpi/splash.png"
convert -size 320x480 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-port-mdpi/splash.png"
convert -size 720x1280 canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-port-xhdpi/splash.png"
convert -size 960x1600  canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-port-xxhdpi/splash.png"
convert -size 1280x1920  canvas:"#bbb" "$DST_PATH/android/app/src/main/res/drawable-port-xxxhdpi/splash.png"

info 'Generating mipmap-hdpi icons...'
convert "$SQUARE_FILE" -resize 162x162 "$DST_PATH/android/app/src/main/res/mipmap-hdpi/ic_launcher_foreground.png"
convert "$CIRCULAR_FILE"  -resize 72x72  "$DST_PATH/android/app/src/main/res/mipmap-hdpi/ic_launcher_round.png"
convert "$SQUARE_FILE" -resize 72x72 "$DST_PATH/android/app/src/main/res/mipmap-hdpi/ic_launcher.png"

info 'Generating mipmap-mdpi icons...'
convert "$SQUARE_FILE" -resize 108x108 "$DST_PATH/android/app/src/main/res/mipmap-mdpi/ic_launcher_foreground.png"
convert "$CIRCULAR_FILE"  -resize 48x48  "$DST_PATH/android/app/src/main/res/mipmap-mdpi/ic_launcher_round.png"
convert "$SQUARE_FILE"  -resize 48x48  "$DST_PATH/android/app/src/main/res/mipmap-mdpi/ic_launcher.png"

info 'Generating mipmap-xhdpi icons...'
convert "$SQUARE_FILE" -resize 216x216 "$DST_PATH/android/app/src/main/res/mipmap-xhdpi/ic_launcher_foreground.png"
convert "$CIRCULAR_FILE"  -resize 96x96  "$DST_PATH/android/app/src/main/res/mipmap-xhdpi/ic_launcher_round.png"
convert "$SQUARE_FILE" -resize 96x96 "$DST_PATH/android/app/src/main/res/mipmap-xhdpi/ic_launcher.png"

info 'Generating mipmap-xxhdpi icons...'
convert "$SQUARE_FILE" -resize 324x324 "$DST_PATH/android/app/src/main/res/mipmap-xxhdpi/ic_launcher_foreground.png"
convert "$CIRCULAR_FILE"  -resize 144x144  "$DST_PATH/android/app/src/main/res/mipmap-xxhdpi/ic_launcher_round.png"
convert "$SQUARE_FILE" -resize 144x144 "$DST_PATH/android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png"

info 'Generating mipmap-xxxhdpi icons...'
convert "$SQUARE_FILE" -resize 432x432 "$DST_PATH/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher_foreground.png"
convert "$CIRCULAR_FILE"  -resize 192x192  "$DST_PATH/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher_round.png"
convert "$SQUARE_FILE" -resize 192x192 "$DST_PATH/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"

info 'Generate Done.'
