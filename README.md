# icatdir: Directory Image Viewer & Manipulator for Kitty

This project provides a command-line based tool to view and manipulate images in a directory. It's built to run in the Kitty terminal and leverages the power of ImageMagick for image manipulations.

## Features

- Browse through images in a specified directory.
- Rotate images clockwise and anticlockwise.
- Modern and easy-to-use keyboard navigation.
- Minimalistic design with clear instructions.

## Demo
![icardir_demo](https://github.com/vbotics/icatdir/assets/10283521/429a24db-513e-4cba-b8d4-4f9da9c91faf)


Image source by [upklyak on Freepik](https://www.freepik.com/free-vector/viking-cartoon-character-animation-2d-barbarian_29222691.htm)

## Prerequisites

- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- [ImageMagick](https://imagemagick.org/index.php)

## Installation

1. Clone the repository or download the script.
2. Make sure you have Kitty and ImageMagick installed on your system.
3. Add this line to your `~/.bashrc` or `~/.zshrc` file:
   ```bash
   alias icatdir="<path_to_the_script>/icatdir.sh"
   ```
   Replace `<path_to_the_script>` with the path where you cloned this repo.
4. Make the script executable:
   ```bash
   chmod +x icatdir.sh
   ```

## Usage
Run the script with the directory path containing your images:
```bash
./icatdir.sh <path_to_your_images_directory>
```
or using the alias:
```bash
icatdir <path_to_your_images_directory>
```

## Keyboard Controls:

⬅️: Previous Image
➡️: Next Image
⬆️: Rotate Clockwise
⬇️: Rotate Anticlockwise
q: Quit

## Contributing
Contributions, issues, and feature requests are welcome! Feel free to check issues page.
