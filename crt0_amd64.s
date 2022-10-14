
.section .text
	jmp _start
.align 8
write:
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF
	.quad 0xFFFFFFFFFFFFFFFF

.section .text

.global _start
_start:
	ret
	jmp main

.global uniexe_write
uniexe_write:
	jmp [write]
