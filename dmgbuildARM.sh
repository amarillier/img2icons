#! /bin/sh
# compile, then create a dmg package
# https://github.com/create-dmg/create-dmg

# go build .
# GOOS=linux GOARCH=arm64 go build -ldflags="-w -s" -o bin/MacOSARM64/
GOOS=darwin GOARCH=arm64 CGO_ENABLED=1 go build -ldflags="-w -s" -o bin/MacOSARM64/
# set executable icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png bin/MacOSARM64/KrankyBearImg2Icons

# cp KrankyBearImg2Icons KrankyBearImg2Icons.app/Contents/MacOS
cp bin/MacOSARM64/KrankyBearImg2Icons KrankyBearImg2Icons.app/Contents/MacOS
test -f KrankyBearImg2IconsARM.dmg && rm KrankyBearImg2IconsARM.dmg
#   --volicon "KrankyBearImg2Icons.icns" \
create-dmg \
  --volname "KrankyBearImg2Icons" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "KrankyBearImg2Icons.app" 200 190 \
  --hide-extension "KrankyBearImg2Icons.app" \
  --app-drop-link 600 185 \
  --eula license.txt \
  "KrankyBearImg2IconsARM.dmg" \
  "KrankyBearImg2Icons.app"
  # --add-file KrankyBearImg2Icons.app ./KrankyBearImg2Icons.app
  # "./"

# set dmg icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png KrankyBearImg2IconsARM.dmg
if [ ! -d installers ]
then
  mkdir installers
fi
cp KrankyBearImg2IconsARM.dmg installers
# cp KrankyBearImg2IconsARM.dmg ~/OneDrive\ -\ KrankyBear\ Inc/Apps/

# "Now this is not the end. It is not even the beginning of the end. But it is, perhaps, the end of the beginning." Winston Churchill, November 10, 1942