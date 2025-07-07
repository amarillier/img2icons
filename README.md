# img2icons
![KrankyBearBeret](https://github.com/user-attachments/assets/e9c4512f-415c-4881-998e-7644d38110ae)

Below section is not yet relevant, this is command line interface (CLI)
only for now, and may remain that way.

If I add a GUI component, below will apply
preferences stored via fyne preferences API land in
~/Library/Preferences/fyne/com.github.amarillier.img2icons/preferences.json
~\AppData\Roaming\fyne\com.github.amarillier.Img2icons\preferences.json
MacOS resource location (sounds and backgrounds): /Applications/Img2icons.app/Contents/Resources
Theme preferences are in ~/Library/Preferences/fyne/settings.json


## Features
Why yet another tool when you can use web based services, Gimp, PhotoShop, 
    even MacOS command line sips and iconutil bits? Those require human
    interaction, internaet access, complexity etc.
This tool creates both Windows and MacOS icons very quickly, easily and
    is easily scriptable or added to a Makefile for build automation.
    Fast, easy, efficient

* See ReleaseNotes.txt
* Accept an input file name in .png, .jpg/.jpeg or .bmp format
* Optionally input required Windows .ico file multiple size images
* Output both Windows .ico and MacOS .icns file formats with the same file
    name as the input, but with .ico and .icns extensions, with multiple
    icon images embedded
* NOTE: this does no image manipulation beyond resizing for the icons, and
    does not create transparent backgrounds. If a png image already has
    transparent backgrounds, they will be preserved.

# To-do / known problems
- No current ability to specify required .icns sizes, defaults are hard coded
- Known problems - needs OpenGL drivers on some Windows - not currently a problem
    since this is a CLI based tool and may remain that way. If I add GUI
    components, this may become a consideration


# License
See license.txt
This is 100% free for anyone to use or misuse any way you like with no warranty as
to suitability or anything else, other than it has no viruses when I compile and
commit to git. But you should always check and scan anything you download from the
internet for viruses anyway. Don't be reckless.

All KrankyBear icons, images, logos used are copyright (c) Allan Marillier, 2024, 2025 ...
