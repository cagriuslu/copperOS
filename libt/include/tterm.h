#ifndef _TTERM_H
#define _TTERM_H

#include <stddef.h>

int tClearTerm();
int __attribute__ ((fastcall)) tPrintChar(int c);
int __attribute__ ((fastcall)) tPrintByte(int h);
size_t __attribute__ ((fastcall)) tPrintStr(char *str);
int __attribute__ ((fastcall)) tPrintWord(int w);
int __attribute__ ((fastcall)) tPrintDword(int dw);

#endif