#repl doesn't process tabs in files right so lets change the processor to read '>' as a tab
.RECIPEPREFIX = >

#SHELL:=/bin/bash   #/bin/bash let's use bash commands

all: make link clean_objects
make:
> as --32 boot.s -o boot.o

link:
> ld -T linker.ld -melf_i386 --oformat=binary boot.o -o boot.bin

clean_objects:
> rm -rf *.o

clean_all:
> rm -rf *.o *.bin