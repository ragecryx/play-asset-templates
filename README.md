# play-asset-templates
Asset templates for Google Play store. Inkscape SVG templates.

Tools that might also help:

- [Android Asset Studio](https://romannurik.github.io/AndroidAssetStudio/index.html)

## What's Required

This is just a quick reminder and can be subject to change.
The current store requirements can be found [here](https://support.google.com/googleplay/android-developer/answer/1078870).

All data can be differentiated by country.

#### Screenshots

- Up to 8 screenshots for each type: Phone, Tablet (7-inch & 10-inch), Android TV, and Wear OS by Google
- JPEG or PNG (24bit)
- If you are making a game probably you want to include 3 landscape screenshots with 16:9 aspect ratio.

#### Store Icon

- PNG (32bit)
- Max Size: 1024kb

Remember: If you create a full square icon (background color extends to the edges of the image), Google Play will dynamically handle creating round corners and the shadow beneath.

#### App Icon

Quick sizes reminder:

|  Title  | Size in px  | Size in dpi |  Multiplier |
|:-------:|:-----------:|:-----------:|:-----------:|
|  mdpi   |    48x48    |     160     |      1x     |
|  hdpi   |    72x72    |     240     |     1.5x    |
|  xhdpi  |    96x96    |     320     |      2x     |
| xxhdpi  |   144x144   |     480     |      3x     |
| xxxhdpi |   192x192   |     640     |      4x     |

In general, the Play store icon is the biggest resolution
of any icon in the Android app.

**Also!** Check out [adaptive icons](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive)

#### Feature Graphic

- JPEG or PNG (24bit)
- Displayed before all the screenshots
- Don't put important info near the edges
- Use large fonts if it contains text
- Can be used to **feature** your app, so there is a case where the app's icon/logo is not nearby.

Note: If you define a promo video the button to play the video will be over this graphic.

#### Promo Graphic

`Deprecated.`

#### TV banner

- JPEG or PNG (24bit)

#### 360 Stereo Image

`Haven't tried that yet. Sorry.`

#### Promo Video

- Can be any YouTube **video** (not playlist or channel url)
- Must be non age-restricted and non monetized.
- Appears before screenshots
- 30-120 sec is good for a video

To capture in-app material check this [gist](https://gist.github.com/FriendlyTester/67c7ad26ab62849aea91)

```bash
#Check if an argument was supplied
if [ -z "$1" ]
  	then
    	echo "No argument supplied, please provide video name"
	else
	   	# start recording
		adb shell screenrecord --bit-rate 6000000 /sdcard/$1.mp4 &

		# Get its PID
		PID=$!

		# Upon a key press
		read -p "Press [Enter] to stop recording..."

		# Kills the recording process
		kill $PID

		# Wait for 3 seconds for the device to compile the video
		sleep 3

		# Download the video
		adb pull /sdcard/$1.mp4

		# Delete the video from the device
		adb shell rm /sdcard/$1.mp4

		# Kill background process incase kill PID fails
		trap "kill 0" SIGINT SIGTERM EXIT
fi
```
