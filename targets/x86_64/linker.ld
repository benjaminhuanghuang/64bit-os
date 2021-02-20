ENTRY(start)

SECTIONS
{
	/* set current address */
	. = 1M;

	.boot :
	{
		KEEP(*(.multiboot_header))
	}

	.text :
	{  
		*(.text)
	}
}