#ifndef _GDT_H
#define _GDT_H

void __attribute__ ((fastcall)) SetupFlatGdt(void *location);

#endif
