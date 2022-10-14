
#ifdef _WIN32
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#include <io.h>
#else
#include <unistd.h>
#endif

int uniexe_write(int fd, void *buf, int nbbytes)
{
	return write(fd, buf, nbbytes);
}

