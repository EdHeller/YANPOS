#Multi BOOT GRUB 1
.set ALIGN,    1<<0             
.set MEMINFO,  1<<1             
.set FLAGS,    ALIGN | MEMINFO  
.set MAGIC,    0x1BADB002       
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM
#end Multi BOOT

.code16                   #generate 16-bit code
.text                     #executable code location
     .globl _start;
_start:                   #code entry point
   mov $0x00, %ax  # set up segments
   mov %ax, %ds
   mov %ax, %es
   mov %ax, %ss     # setup stack
   mov $0x7C00, %sp # stack grows downwards from 0x7C00

    mov $0x00, %ah  # clear
    mov $0x03, %al  # tty mode
    int $0x10       # call BIOS video interrupt

    mov $0x01, %ah #cusor
    mov $0x2607, %cx # hide cursor
    int $0x10       # call BIOS video interrupt
    cli
    cld

    mov $0x0e, %ah # tty mode
    mov $'A', %al
    int $0x10


     . = _start + 510     #mov to 510th byte from 0 pos
     .byte 0x55           #append boot signature
     .byte 0xaa           #append boot signature
