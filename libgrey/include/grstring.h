#ifndef _GR_STRING_H
#define _GR_STRING_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void* memcpy_asm(void* __restrict, const void* __restrict, size_t);

#ifdef __cplusplus
}
#endif

#endif