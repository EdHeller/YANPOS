ENTRY(_start)

SECTIONS {
	. = 0x7e00;
	.text : {
    *(.multiboot)
		*(.text)
		*(.data)
		*(.rodata)
		*(.bss)
	}
}
