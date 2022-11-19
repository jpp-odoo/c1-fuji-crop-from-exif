tell application "Capture One 21"
	set currentSelection to selected variants
	repeat with theVariant in currentSelection
		try
			set imagePath to (get path of (get parent image of theVariant))
			-- Extract the image aspect ratio from the EXIF
			set commandLine to "eval `/usr/libexec/path_helper -s`; /opt/homebrew/bin/exiftool -X -RawImageAspectRatio \"" & imagePath & "\""
			set xmlExif to (do shell script commandLine)
			tell application "System Events"
				set xmlData to make new XML data with properties {name:"xmldata", text:xmlExif}
				
				tell XML element "rdf:RDF" of xmlData
					tell XML element "rdf:Description"
						set ratio to value of XML element "RAF:RawImageAspectRatio"
					end tell
				end tell
			end tell
			tell theVariant
				set originalCrop to crop
				if (ratio = "1:1") then
					set crop width to crop height
				else if (ratio = "16:9") then
					set desiredCropHeight to ((crop width * 9) / 16) div 1
					set crop height to desiredCropHeight
				end if
				if crop height is less than 0 or crop width is less than 0 then
					set crop to originalCrop
				end if
			end tell
		on error number -1728
			-- Ignore this error, it means that the EXIF information doesn't exist
		end try
	end repeat
end tell
