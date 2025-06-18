#! /bin/sh
# compile, then create a dmg package
# https://github.com/create-dmg/create-dmg

# go build .
GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -ldflags="-w -s" -o bin/MacOSAMD64/
# set executable icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png bin/MacOSAMD64/KrankyBearImg2Icons

cp bin/MacOSAMD64/KrankyBearImg2Icons KrankyBearImg2Icons.app/Contents/MacOS

test -f KrankyBearImg2IconsIntel.dmg && rm KrankyBearImg2IconsIntel.dmg
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
  "KrankyBearImg2IconsIntel.dmg" \
  "KrankyBearImg2Icons.app"
  # --add-file KrankyBearImg2Icons.app ./KrankyBearImg2Icons.app
  # "./"

# set dmg icon
./setIcon.sh Resources/Images/KrankyBearHardHat.png KrankyBearImg2IconsIntel.dmg
if [ ! -d installers ]
then
  mkdir installers
fi
cp KrankyBearImg2IconsIntel.dmg installers
# cp KrankyBearImg2IconsIntel.dmg ~/OneDrive\ -\ KrankyBear\ Inc/Apps/

# "Now this is not the end. It is not even the beginning of the end. But it is, perhaps, the end of the beginning." Winston Churchill, November 10, 1942