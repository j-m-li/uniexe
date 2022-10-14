ENTRY(_start)

SECTIONS
{
    .text 0 : AT(0) {
	*(.text) 
	*(.rodata.*) 
	*(.data) 
	*(.bss) 
     }
/*
     .rodata : {
	*(.rodata) 

     }
*/
     .shstrtab : {
	*(.shstrtab) 
	end = .;
     }
     .eh_frame : {
	*(.eh_frame) 
     }
/*
    .data : {
	*(.data) 
	end = .;
     }
*/
     /DISCARD/ : {
	*(.*)
     }
}

