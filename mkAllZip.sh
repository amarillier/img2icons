#! /bin/sh

version="0.1.0"
cp README.md installers/KrankyBearImg2Icons/Resources
cp ReleaseNotes.txt installers/KrankyBearImg2Icons/Resources
cd installers || exit
cp ../bin/WinAMD64/KrankyBearImg2Icons.exe KrankyBearImg2Icons
zip -r KrankyBearImg2IconsWinAMD.zip KrankyBearImg2Icons
rm KrankyBearImg2Icons/KrankyBearImg2Icons.exe

cp ../bin/MacOSAMD64/KrankyBearImg2Icons KrankyBearImg2Icons
zip -r KrankyBearImg2IconsMacOSAMD.zip KrankyBearImg2Icons
rm KrankyBearImg2Icons/KrankyBearImg2Icons

cp ../bin/MacOSARM64/KrankyBearImg2Icons KrankyBearImg2Icons
zip -r KrankyBearImg2IconsMacOSARM.zip KrankyBearImg2Icons
rm KrankyBearImg2Icons/KrankyBearImg2Icons

cp ../bin/LinuxAMD64/KrankyBearImg2Icons KrankyBearImg2Icons
zip -r KrankyBearImg2IconsLinuxAMD.zip KrankyBearImg2Icons
rm KrankyBearImg2Icons/KrankyBearImg2Icons

cp ../bin/LinuxARM64/KrankyBearImg2Icons KrankyBearImg2Icons
zip -r KrankyBearImg2IconsLinuxARM.zip KrankyBearImg2Icons
rm KrankyBearImg2Icons/KrankyBearImg2Icons

# see gh docs: https://cli.github.com/manual/gh_release_create
awk '/0.1.0/{flag=1}/^$/{flag=0}flag' ../ReleaseNotes.txt > latestReleaseNotes.txt
gh release create --title v"$version" v"$version" --draft --notes-file latestReleaseNotes.txt --prerelease KrankyBearImg2IconsWinAMD.zip KrankyBearImg2IconsMacOSAMD.zip KrankyBearImg2IconsMacOSARM.zip KrankyBearImg2IconsLinuxAMD.zip KrankyBearImg2IconsLinuxARM.zip

echo "Created draft release $version"
echo "Remember to publish when ready"
echo "gh release edit v$version --draft=false --prerelease=false"