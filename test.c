// The authors disclam copyright to this source code

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#ifdef _WIN32
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#include <io.h>
#include <windows.h>
#else
#include <unistd.h>
#endif

#define EXESIZE (64 * 1024 * 1024)
#ifdef _WIN32 
#ifdef _WIN64
#define UNIEXE_PROG "hello.amd64"
#else
#define UNIEXE_PROG "hello.i386"
#endif
#endif

void *alloc_exe(int size)
{
   return VirtualAlloc(NULL, size, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE );

}

int main(int argc, char *argv[])
{
	int fd;
	int ret;
	int size = 0;
	char *buf = alloc_exe(EXESIZE);
	if (buf == NULL) {
		printf("Cannot allocate memory\n");
		exit(-1);
	}
	fd = open(UNIEXE_PROG, O_RDONLY);
	if ((fd < 0) || (size = read(fd, buf, EXESIZE)) < 1) {
		printf("Cannot load " UNIEXE_PROG "\n");
		exit(-1);
	}
	close(fd);

	// pass a pointer to the original write() to the loaded universal executable
	((long*)buf)[4] = (long)write;
/*
	fd = open("test.dump", O_WRONLY|O_CREAT|O_TRUNC, 0660);
	write(fd, buf, size);
	close(fd);
*/
	printf(UNIEXE_PROG " loaded...\n");
	ret = ((int(*)(void))buf)();
	printf(UNIEXE_PROG " exit value %d...\n", ret);
	return ret;
}

