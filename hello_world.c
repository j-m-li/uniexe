
#include "uniexe.h"


static int var[] = {'HHHH', 'E', 'L', 'L', 'O'};
//int *ptr = var;

int main(void)
{
	char txt[] = "Hello World!!!\n";
	write(1, txt, sizeof(txt)-1);
	//write(1, ptr, 4); // does not work...
	write(1, var, 4);
	return 101;
}

