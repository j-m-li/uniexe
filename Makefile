
all:	hello.i386 test
	@echo done.

hello_c:
	clang -o hello_c.exe hello_world.c uniexe.c

hello.amd64: 
	clang -fPIC --target=x86_64-pc-linux-gnu -fuse-ld=lld -o hello_amd64.elf -nostdlib -static -T link_amd64.ld crt0_amd64.s hello_world.c
	llvm-objdump -d hello_amd64.elf > hello_amd64.lst
	llvm-objcopy hello_amd64.elf -O binary hello.amd64

hello.i386: hello_world.c crt0_i386.s
	clang -fPIC --target=i386-pc-linux-gnu -fuse-ld=lld -o hello_i386.elf -nostdlib -static -T link_i386.ld crt0_i386.s hello_world.c
	llvm-objdump -d hello_i386.elf > hello_i386.lst
	llvm-objcopy hello_i386.elf -O binary hello.i386

test: test.c
	clang -o test.exe test.c
clean:
	rm -f *.o *.elf
	rm -f hello_c hello_c.exe test.exe test.dump
	rm -f hello.amd64 hello_amd64.elf hello_amd64.lst
	rm -f hello.i386 hello_amd64.i386 hello_i386.lst

