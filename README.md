# MANDELCALC

MANDELCALC is a program that allows to generate visualisations of the Mandelbrot set on the C64. 
It utilizes fixed point arithmetic instead of the floating point routines contained in the BASIC-ROM
and can use both the multiciolor mode (having a 160x200 resolution in four colours) and
the hires mode (320x200 pixels in two colors). The user interface is inspired by a command line
interface and offers the following commands:

| Command | Comment |
|-|-|
|`VAL` | Displays all values which are relevant for computation. All values are displayed in hex. |
|`RUN` | Switches to graphics mode and starts a new calculation using the selected graphics mode. The calculation can be interrupted by a key press and can be resumed with `CNT`|
|`LOD` | Loads a picture from the floppy drive and displays it. Press any key to return to the CLI. The device number can be changed by the `DEV` command.| 
|`SAV` | Saves a picture to a floppy disc. The device number can be changed by the `DEV` command. |
|`SHO` | Shows the current picture using the selected graphics mode. Press any key to return to the CLI. |
|`PXL` | Allows to enter the coordinates of a pixel, that serves as the new upper left corner to be used during the next calculation. |
|`INZ` | Increases the zoom level by halving the stepping width in X and Y direction. |
|`MCL` | Switch to multicolour mode. As this mode only has half of the resolution in X direction, you may have to use the `DBX` command to double the stepping width in X direction in order to preserve the aspect ratio of the picture. |
|`DBX` | This command doubles the stepping width in X direction. |
|`SIT` | This command allows to set the maximum number of iterations to be performed. The new value has to be <= 254. |
|`HIR` | Switch to hires mode. As this mode has double the resolution in X direction, you may have to use the `HVX` command to halve the stepping width in X direction in order to preserve the aspect ratio of the picture.|
|`HVX` | Halves the stepping width in X direction. |
|`RES` | Resets the computation values to the default, i.e. the classic Mandelbrot set picture. The stepping width is adapted to the current graphics mode. |
|`DEV` | Allows to set the device number used for load and save to a value between 8 and 11. |
|`SCL` | This allows to set the four colours which are used for colouring the picture. |
|`GCL` | Displays the four colours which are used for colouring the picture. |
|`SXL` | As `PXL` this allows to change the upper left corner used for the next calculation. In contrast to `PXL` this command allows to select the pixel via a crosshair sprite controlled by the joystick in port 2. |
|`CNT` | Resumes an interrupted calculation. |
|`DIR` | Shows the directory of the floppy disc currently inserted in the selected drive. |
|`DSC` | Displays a help message for the selected command. |
|`H`| Displays a list of all commands. |
|`X`| Exits MANDELCALC. |

# Contents of disc image

|Filename| Comment|
|-|-|
|`LOADER.PRG`| A program that loads the main program. |
|`MANDELBR.PRG`| The main program. |
|`MDEFAULT.PIC`| The classic Mandelbrot picture in multicolor mode. |
|`HDEFAULT.PIC`| The classic Mandelbrot picture in hires mode. |

# Building MANDELCALC

In order to build MANDELCALC you need to install the ACME Makroassembler. The makefile also
builds a disk image. For this the tool `c1541` is used that is distributed as part of the VICE
emulator. 

If you want to build MANDELCALC on a Mac you have to adapt the makefile in such a way that the
paths to ACME and `c1541` reflect the situation on your system. 