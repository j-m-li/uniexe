// The authors disclam copyright to this source code

#ifndef _UNIEXE_H
#define _UNIEXE_H

int uniexe_write(int fd, void *buf, int nbbytes); 
#define write uniexe_write

#endif
