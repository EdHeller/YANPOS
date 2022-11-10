.code16                   #generate 16-bit code
.text                     #executable code location
     .globl _start;
_start:                   #code entry point

xor %ax, %ax
mov %ax, %ds
mov %ax, %es
mov %ax, %ss       
mov $0x7C00, %sp

  mov $0x00, %ah
  mov $0x03, %al  # text mode 80x25 16 colours
  int $0x10

  mov $0x01, %ah
  mov $0x2607, %cx
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $'W', %al
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $'I', %al
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $'P', %al
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $' ', %al
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $'O', %al
  int $0x10

  mov $0x0e, %ah # tty mode
  mov $'S', %al
  int $0x10

.org 510
.word 0xaa55
  #. = _start + 510     #mov to 510th byte from 0 pos
  #.byte 0x55           #append boot signature
  #.byte 0xaa           #append boot signature
