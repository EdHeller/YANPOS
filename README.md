# Getting started

YANPOS
Yet ANother Pet Operating System

The bash script make.sh will compile and run the ~~kernel~~ bootloader (eventually kernel hopefully). 

Now for web as well using ~~js-dos~~ v86 

TBD.
Boot into protected mode.
Enable the A20 line. Set other prams as needed.
Interupts and testing scripts.

notes:

  mov $0x00, %ah
  mov $0x03, %al  # text mode 80x25 16 colours
  int $0x10

  mov $0x01, %ah
  mov $0x2607, %cx
  int $0x10
  
#the above 2 real mode instructions don't actually work on some wasm / js 86x emulators.
#see: js-dos (configuration displays A multiple times and occasionally hearts maybe a wait instruction is required?)
#em-dosbox packing.py most virual envornments can't hold the entire emscripten setup. e.g. repl.it
#JSLinux: Splitting a single bootloader into multiple archives is a little overkill during rapid deveolment. Documentation on the split utility seems to be a little sparse.
#v86 (copy.sh's) crashes. It also lacks far jump instructions. Assumedly the above realmode instructions might not be avaliable.
