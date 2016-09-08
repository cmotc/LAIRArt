#! /bin/sh
rm *.log *.out *.log
gccgo lair-image-gen.go 1> test.log 2> err.log
./a.out
