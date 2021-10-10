# buildiconset
Generates the bewildering collection of icons and screen files needed for iOS and Android mobile apps.

This is an update of a script originally by Wenva <lvyexuwenfa100@126.com>. The modifications were written by Anthony W. Hursh <pulpgrinder@protonmail.com>, and are released under a license identical to the original.

Wenva's original script only generated the icons that were needed for iOS circa 2014. Since then, the number of icons needed for iOS has proliferated. The script now generates all resolutions needed for iOS as of late 2021 plus a few extra resolutions,for possible future use). 

In addition, the script also generates the scads of image files (icons, logos, and splash screens) needed to build an Android app.

USAGE:
   ./buildiconset.sh squarefile circularfile dstpath

DESCRIPTION:

This script makes generating iOS and Android app icons easier and simpler. You will need to install ImageMagick in order for it to work, if you don't already have it. If you're on a Mac with Homebrew installed, you can get ImageMagick by running:
    
   'brew install ImageMagick'
    
from the terminal. If you're on other platforms, you're on your own. :-)
    
The script generates 47 icon/logo/promo image files and 11 blank Android splash screens, starting with only two original files. Obviously the results may not be as good as individually hand-tuning each file, but the result is often quite acceptable. If nothing else, it provides a basis to get your app running for testing.
    
 The two files you need are:

squarefile - A square png image with your app icon/logo. It should be at least 1024x1024 for good results, but I recommend making it at least 4096x4096 if you can (screen resolutions keep getting higher all the time... working at 4096x4096 may future-proof you, at least for a while).
    
circularfile - This is also a square png image, but one that has an inscribed circular region containing the important parts of the icon/logo (basically, you just make sure nothing important is sticking out of a circular region as large as the square and contained inside it). This is used to make circular buttons and icons for Android. 
    
The final parameter is:
    
dstpath - The destination path to put the generated images.

AUTHOR:
    Pawpaw <lvyexuwenfa100@126.com>
    
MODIFICATIONS:
    Anthony W. Hursh <pulpgrinder@protonmail.com>

LICENSE:
    MIT license.

EXAMPLE:

   ./buildiconset.sh base-square-image.png base-circular-image.png output_path
