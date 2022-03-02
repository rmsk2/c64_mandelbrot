# MANDELCALC

MANDELCALC is a program that allows to generate visualisations of the Mandelbrot set on the C64. 
It utilizes fixed point arithmetic instead of the floating point routines contained in the BASIC-ROM
and can use both the multiciolor mode (having a 160x200 resolution in four colours) and
the hires mode (320x200 pixels in two colors). The user interface is inspired by a command line
interface and offers the following commands:

| Command | Comment |
|-|-|
|`VAL` | Displays all values which are relevant for compuation. All values are displayed in hex. |
|`RUN` | Switches to graphics mode and starts a new calculation using the selected graphics mode. |
|`LOD` | Loads a picture from the floppy drive. The device number can be changed by the `DEV` command.| 
|`SAV` | Saves a picture to a floppy disc. The device number can be changed by the `DEV` command. |
|`SHO` | Shows the current picture using the selected graphics mode. Press any key to return to the CLI. | 
