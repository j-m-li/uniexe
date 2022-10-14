ENTRY(_start)

SECTIONS
{
    .text 0 : AT(0) {
	*(.boot) 
	*(.text) 
	*(.data) 
	*(.bss) 
	end = .;
     }
     .shstrtab : {
	*(.shstrtab) 
     }

/*    .data : {
	*(.data) 
	end = .;
     }
*/
     /DISCARD/ : {
	*(.*)
     }
}

