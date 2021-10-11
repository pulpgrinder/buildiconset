# buildiconset
Generates the bewildering collection of icons and screen files needed for iOS and Android mobile apps.

This is an update of a script originally by Wenva <lvyexuwenfa100@126.com>. The modifications were written by Anthony W. Hursh <pulpgrinder@protonmail.com>, and are released under a license identical to the original.

Wenva's original script only generated the icons that were needed for iOS circa 2014. Since then, the number of icons needed for iOS has proliferated. The script now generates all resolutions needed for iOS as of mid-October 2021 plus a few extra resolutions for possible future use. 

In addition, the updated script now also generates the scads of image files (icons, logos, and splash screens) needed to build an Android app.

USAGE:

    ./buildiconset.sh squarefile circularfile dstpath

DESCRIPTION:

This script makes generating iOS and Android app icons easier and simpler. You will need to install ImageMagick in order for it to work (if you don't already have it). If you're on a Mac with Homebrew installed, you can get ImageMagick by running:
    
    brew install ImageMagick
    
from the terminal. If you're on other platforms, you're on your own. :-)
    
The script generates 47 icon/logo/promo image files and 11 blank Android splash screens (58 image files in total) starting with only two original files. This is enough to cover both platforms, at least for now, with a few extra resolutions that represent a wild guess of what might be needed in the near future (but only Apple and Google know for sure).

Obviously the results may not be as good as individually hand-tuning each file, but the result is often quite acceptable, especially if you start with base images that are large enough (anyone who works with images knows that the results from shrinking an image are generally better than the results from making it larger). If nothing else, the generated image set will provide a basis to get your app running for testing. Even if some of the files need later manual tweaking, it's still a win over sitting there reading each image size spec line from two sets of docs, then manually resizing and saving for each line...58 times. :-)
    
The two files you need are:

squarefile - A square png image with your app icon/logo. It should be at least 1024x1024 for good results, but I recommend making it at least 4096x4096 if you can (screen resolutions keep getting higher all the time... working at 4096x4096 may future-proof you, at least for a while).
    
circularfile - This is also a square png image, but one that has an inscribed circular region containing the important parts of the icon/logo. It's used to make circular icons for Android.  Basically, you just need to make sure nothing important is sticking out of a circular region as large as the square and contained inside it, as it will be cropped off. If you're sure you've got plenty of border space, you can just use the same file as the previous. Again, 4096x4096 seems like a reasonable size. 
    
The final parameter is:
    
dstpath - The destination path to put the generated images.

ORIGINAL AUTHOR:

Pawpaw <lvyexuwenfa100@126.com>
    
MODIFICATIONS:

Anthony W. Hursh <pulpgrinder@protonmail.com> (please contact me if there are any problems with this version of the script, rather than bugging Pawpaw...any errors are my own).

LICENSE:

MIT license.

EXAMPLE:

    ./buildiconset.sh base-square-image.png base-circular-image.png output_path
