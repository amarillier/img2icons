#! /bin/sh
# compile, then create a dmg package
# https://github.com/create-dmg/create-dmg

# go build .
# GOOS=linux GOARCH=arm64 go build -ldflags="-w -s" -o bin/MacOSARM64/
GOOS=darwin GOARCH=arm64 CGO_ENABLED=1 go build -ldflags="-w -s" -o bin/MacOSARM64/
# set executable icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png bin/MacOSARM64/img2icons

# cp img2icons img2icons.app/Contents/MacOS
cp bin/MacOSARM64/img2icons img2icons.app/Contents/MacOS
test -f img2iconsARM.dmg && rm img2iconsARM.dmg
#   --volicon "img2icons.icns" \
create-dmg \
  --volname "img2icons" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "img2icons.app" 200 190 \
  --hide-extension "img2icons.app" \
  --app-drop-link 600 185 \
  --eula license.txt \
  "img2iconsARM.dmg" \
  "img2icons.app"
  # --add-file img2icons.app ./img2icons.app
  # "./"

# set dmg icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png img2iconsARM.dmg
if [ ! -d installers ]
then
  mkdir installers
fi
cp img2iconsARM.dmg installers
# cp img2iconsARM.dmg ~/OneDrive\ -\ KrankyBear\ Inc/Apps/

# "Now this is not the end. It is not even the beginning of the end. But it is, perhaps, the end of the beginning." Winston Churchill, November 10, 1942