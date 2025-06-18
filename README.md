# KrankyBearImg2Icons
Below section is not yet relevant, this is command line interface (CLI)
only for now, and may remain that way.

If I add a GUI component, below will apply
preferences stored via fyne preferences API land in
~/Library/Preferences/fyne/com.github.amarillier.KrankyBearImg2Icons/preferences.json
~\AppData\Roaming\fyne\com.github.amarillier.KrankyBearImg2Icons\preferences.json
MacOS resource location (sounds and backgrounds): /Applications/KrankyBearImg2Icons.app/Contents/Resources
Theme preferences are in ~/Library/Preferences/fyne/settings.json


## Features
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
- Known problems - needs OpenGL drivers on some Windows - not currently a problem
    since this is a CLI based tool and may remain that way. If I add GUI
    components, this may become a consideration
- No current ability to specify required .icns sizes, defaults are hard coded


