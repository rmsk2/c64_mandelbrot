# On MacOS use make MAC=1
# On Linux simply use make

all: loader mandelbr mandelbr.d64

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
	rm loader
	rm loader.txt

loader: loader.a
	$(ACME) -l loader.txt loader.a

mandelbr: main.a arith16.a  hires.a diag.a disk_io.a string.a repl.a
	$(ACME) -l mandelbr.txt main.a

mandelbr.d64: loader mandelbr
	$(C1541) -format mandelbr,2j d64 $(WORKDIR)/mandelbr.d64 -write $(WORKDIR)/loader -write $(WORKDIR)/mandelbr -write $(WORKDIR)/multidefault.pic "mdefault.pic,s" -write $(WORKDIR)/hiresdefault.pic "hdefault.pic,s"

run: mandelbr.d64
	x64sc mandelbr.d64