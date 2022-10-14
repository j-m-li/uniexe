# The authors disclam copyright to this source code

.section .text
.global _start
_start:
	jmp begin
.org 8
	.long 0xA
	.long 0xB
	
write:
	.long 0xC
	.long 0xD

get_eip:
	movl 0(%esp), %eax
	ret
begin:
	call get_eip
begin1:
	addl $(main-begin1), %eax
	pushl %eax
	ret 	// call int main(void)

	
.global uniexe_write
uniexe_write:
	call get_eip
uniexe_write1:
	addl $(write-uniexe_write1), %eax // address of write() passed by the original exe
	movl 0(%eax), %eax
	jmp *%eax	// jump to write()

