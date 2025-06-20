#! /bin/sh

version="0.1.0"
cp README.md installers/img2icons/Resources
cp ReleaseNotes.txt installers/img2icons/Resources
cd installers || exit
cp ../bin/WinAMD64/img2icons.exe img2icons
zip -r img2iconsWinAMD.zip img2icons
rm img2icons/img2icons.exe

cp ../bin/MacOSAMD64/img2icons img2icons
zip -r img2iconsMacOSAMD.zip img2icons
rm img2icons/img2icons

cp ../bin/MacOSARM64/img2icons img2icons
zip -r img2iconsMacOSARM.zip img2icons
rm img2icons/img2icons

cp ../bin/LinuxAMD64/img2icons img2icons
zip -r img2iconsLinuxAMD.zip img2icons
rm img2icons/img2icons

cp ../bin/LinuxARM64/img2icons img2icons
zip -r img2iconsLinuxARM.zip img2icons
rm img2icons/img2icons

# see gh docs: https://cli.github.com/manual/gh_release_create
awk '/0.1.0/{flag=1}/^$/{flag=0}flag' ../ReleaseNotes.txt > latestReleaseNotes.txt
gh release create --title v"$version" v"$version" --draft --notes-file latestReleaseNotes.txt --prerelease img2iconsWinAMD.zip img2iconsMacOSAMD.zip img2iconsMacOSARM.zip img2iconsLinuxAMD.zip img2iconsLinuxARM.zip

echo "Created draft release $version"
echo "Remember to publish when ready"
echo "gh release edit v$version --draft=false --prerelease=false"