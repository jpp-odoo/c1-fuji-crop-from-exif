# Why?
Do you have a Fujifilm camera and use the different aspect ratios (3:2 - 16:9 - 1:1) , but the crop is not recognized by Capture One?
This script solves this issue.

This work was inspired/adapted from [bezineb5/c1-crop-from-exif](https://github.com/bezineb5/c1-crop-from-exif) for Leica Cameras.

# Cameras
This script was only tested with the Fujifilm X-T3 camera, but as the aspect ratio information is found on the exif it should be work with others fujifilm cameras too.

# Requirements
* A recent version of Capture One MacOS (unfortunatelly, the Windows version does not allow scripting)
* [ExifTool](https://sno.phy.queensu.ca/~phil/exiftool/) (see below for installation)

# Installation
First, you need to install ExifTool. The easiest method is to use [Homebrew](https://brew.sh/).
In a terminal, type:
```bash
# Install ExifTool
brew install exiftool
```

Then, copy the script into the Capture One scripting folder:
* Download the file [Fuji Crop from EXIF.applescript](https://raw.githubusercontent.com/jpp-odoo/c1-fuji-crop-from-exif/main/Fuji%20Crop%20from%20EXIF.applescript)
* In Capture one, go to menu *Scripts > Open Scripts Folder*
* Copy the downloaded file in that directory (which is  "~/Library/Scripts/Capture One Scripts/")
* Go back to Capture One, choose menu *Scripts > Update Scripts Menu*
* Done!

Note: if you have a different version of Capture One than the 21, open the script and replace the string "Capture One 21" by "Capture One xx", where xx is your version.

# Usage
In Capture One, select all images you want to apply the EXIF crop to. Then choose menu *Scripts > Fuji Crop from EXIF*
