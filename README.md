# MANDELCALC

MANDELCALC is a program that allows to generate visualisations of the Mandelbrot set on the C64. 
It utilizes fixed point arithmetic instead of the floating point routines contained in the BASIC-ROM
and can use both the multiciolor mode (having a 160x200 resolution in four colours) and
the hires mode (320x200 pixels in two colours). By default the hires mode is active. The user 
interface is inspired by a command line interface and offers the following commands:

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

Example picture in hires mode:

![](/example_hires.png?raw=true "Example picture in hires mode")

Example picture in multicolor mode:

![](/example_multicolor.png?raw=true "Example picture in multicolor mode")

# Contents of disc image

Releases contain a D64 disk image which holds the following files:

|Filename| Comment|
|-|-|
|`LOADER.PRG`| A program that loads the main program. |
|`MANDELBR.PRG`| The main program. |
|`MDEFAULT.PIC`| The classic Mandelbrot picture in multicolor mode. |
|`HDEFAULT.PIC`| The classic Mandelbrot picture in hires mode. |

After mounting the disk image (in drive 8) use `LOAD "LOADER.PRG",8` and after that 
`RUN` to start MANDELCALC.

# Building MANDELCALC

In order to build MANDELCALC you need to install the ACME Makroassembler. The makefile also
builds a disk image. For this the tool `c1541` is used that is distributed as part of the VICE
emulator. 

If you want to build MANDELCALC on a Mac you have to adapt the makefile in such a way that the
paths to ACME and `c1541` reflect the situation on your system. Additionally you have to define
the variable `MAC` when exeuting `make`, i.e. you have to use for instance `make MAC=1`.

# Tips

- Increasing the maximum number of iterations yields a mathematically more accurate result but creates not necessarily more interesting pictures. Most pictures I like have been computed with an iteration depth between 24 and 40.
- If you want to change the device number the loader program uses, modify the value of the variable `DEFAULT_DRIVE` in `loader.a`.
- When finished the programm beeps `ENDE ENDE ENDE` in morse code
- If you are using VICE you can get faster results by running MANDELCALC with `xscpu64` which emulates a C64 with an up to 20 times faster CPU. If you want most features to work correctly when using the super CPU you have to uncomment the line `;SUPER_CPU = 1` in `main.a`. If you use the "stock" version of MANDELCALC with the super CPU the `SXL` command becomes more or less unusable. Even when building MANDELCALC in super CPU mode the morse code timing will not be corrected.
- When a claculation is finished or interrupted MANDELCALC prints info about the elapsed time. For this feature the time of day clock in one of the CIAs is used. MANDELCALC configures this clock to assume a 50Hz mains frequency. If you want to change that comment out the line `CLOCK_50_HZ = 1` in `main.a` which makes the C64 assume a 60 Hz mains frequency.    