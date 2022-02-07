# On MacOS use make MAC=1
# On Linux simply use make

all: mandelbr mandelbr.d64

ifdef MAC
ACME=../acme/acme
C1541=/Applications/vice-gtk3-3.5/bin/c1541
WORKDIR=/Users/martin/data/c64_mandelbrot
else
ACME=acme
C1541=c1541
WORKDIR=.
endif

clean:
	rm mandelbr
	rm mandelbr.d64
	rm mandelbr.txt

mandelbr: main.a arith16.a  hires.a diag.a disk_io.a string.a
	$(ACME) -l mandelbr.txt main.a

mandelbr.d64: mandelbr
	$(C1541) -format mandelbr,2j d64 $(WORKDIR)/mandelbr.d64 -write $(WORKDIR)/mandelbr

run: mandelbr.d64
	x64sc mandelbr.d64