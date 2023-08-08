#include <stdio.h>
#include <stdlib.h>

int get_SEEK_SET() { return SEEK_SET; }
int get_SEEK_END() { return SEEK_END; }
int get_SEEK_CUR() { return SEEK_CUR; }

int HexToInt(const char* hex)
{ return (int)strtoll(hex, NULL, 0); }