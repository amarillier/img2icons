package main

// update-alternatives --config editor
// sudo systemctl set-default multi-user.target
// add tanium to /etc/group sudo group

import (
	"flag"
	"fmt"
	"image"
	"image/draw"
	"image/jpeg"
	"image/png"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"golang.org/x/image/bmp"

	"github.com/nfnt/resize"
	"github.com/sergeymakinen/go-ico"
	"github.com/tonyhb/goicns"
)

var appVersion = "0.0.1" // see FyneApp.toml
var appAuthor = "Allan Marillier"
var appName = "KrankyBearImg2Icons"
var appCopyright = "Copyright (c) Allan Marillier, 2024-" + strconv.Itoa(time.Now().Year())

func main() {
	var sizes []uint
	var img image.Image

	// Define the command-line flag for the image file name
	imgFile := flag.String("image", "", "Path to the input image file (png, jpg or bmp)")
	mysizes := flag.String("sizes", "", "Sizes for the ICO file (comma-separated, e.g., 16,32,48,64,128,256)")
	flag.Parse()

	// Check if the image file name is provided
	if *imgFile == "" {
		fmt.Println("Please provide the path to the input image file using the -image flag")
		fmt.Println(".png, .jpg/.jpeg and .bmp images are supported")
		fmt.Println("Both Windows .ico and MacOS .icns format icons will be generated")

		fmt.Println("\nOptionally also provide icon image sizes using the -sizes flag, comma separated")
		fmt.Println("e.g. -sizes 16,32,48,64,128,256")
		fmt.Println("If sizes are not specified, above listed sizes will all be included by default")

		fmt.Println("\nUsage: KrankyBearImage2Icons -image <path_to_image_file> [-sizes <comma_separated_sizes>]")
		os.Exit(1)
	}
	ext := filepath.Ext(*imgFile)
	name := strings.TrimSuffix(*imgFile, ext)
	fmt.Println("Source image file:", *imgFile)
	file, err := os.Open(*imgFile)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	if *mysizes == "" {
		// Using default sizes if none are specified
		sizes = []uint{256, 128, 64, 48, 32, 16}
		fmt.Println("Using default sizes:", sizes)
	} else {
		// Using user specifed sizes
		fmt.Println("Custom sizes specified:", *mysizes)
		parts := strings.Split(*mysizes, ",")
		// Convert each part to uint and append to the slice
		for _, part := range parts {
			value, err := strconv.ParseUint(part, 10, 32)
			if err != nil {
				panic(err)
			}
			sizes = append(sizes, uint(value))
		}
	}

	if ext == ".png" || ext == ".PNG" {
		fmt.Println("Decoding the png file:", *imgFile)
		img, err = png.Decode(file)
		if err != nil {
			panic(err)
		}
	} else if ext == ".jpg" || ext == ".jpeg" || ext == ".JPG" || ext == ".JPEG" {
		fmt.Println("Decoding the jpg file:", *imgFile)
		img, err = jpeg.Decode(file)
		if err != nil {
			panic(err)
		}
	} else if ext == ".bmp" || ext == ".BMP" {
		fmt.Println("Decoding the bmp file:", *imgFile)
		img, err = bmp.Decode(file)
		if err != nil {
			panic(err)
		}
	} else {
		fmt.Println("Unsupported image format" + ext + ", must be .png, .jpg/jpeg or .bmp")
		os.Exit(1)
	}

	// Create a slice to hold the resized images
	var images []image.Image

	// Resize the image to each size and add to the slice
	for _, size := range sizes {
		resizedImg := resize.Resize(size, size, img, resize.Lanczos3)
		// Convert resized image to RGBA
		rgba := image.NewRGBA(resizedImg.Bounds())
		draw.Draw(rgba, rgba.Bounds(), resizedImg, image.Point{}, draw.Src)
		images = append(images, rgba)
	}

	f, _ := os.Create(name + ".ico")
	icoerr := ico.EncodeAll(f, images)
	if icoerr != nil {
		fmt.Println(".ico write error", icoerr)
	} else {
		fmt.Println(".ico file created: " + name + ".ico")
	}
	f.Close()

	// Create a new ICNS object and add the image
	icns := goicns.NewICNS(img)
	if err = icns.Construct(); err != nil {
		fmt.Println(".icns encoding error:", err.Error())
		return
	}

	outputFile := name + ".icns"
	icnserr := icns.WriteToFile(outputFile, 0666)
	if icnserr != nil {
		fmt.Println(".icns write error", icnserr)
	} else {
		fmt.Println(".icns file created: " + name + ".icns")
	}
	os.Exit(0)
}

// "Now this is not the end. It is not even the beginning of the end. But it is, perhaps, the end of the beginning." Winston Churchill, November 10, 1942
