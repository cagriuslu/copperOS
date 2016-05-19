#include <tterm.h>

#include <stddef.h>
#include <tint.h>

byte tTermCurrPosX;
byte tTermCurrPosY;

int tClearTerm()
{
	byte *ptr;
	int i,j;
	for (i = 0; i < 25; i++)
	{
		for (j = 0; j < 80; j++)
		{
			ptr = (byte*) ((i * 80 + j) * 2 + 0xb8000);
			ptr[0] = 0x00;
			ptr[1] = 0x07;
		}
	}
	
	return 0;
}

int __attribute__ ((fastcall)) tPrintWord(int w)
{
	tPrintByte(w >> 8);
	tPrintByte(w);
	return w;
}

int __attribute__ ((fastcall)) tPrintDword(int dw)
{
	tPrintByte(dw >> 24);
	tPrintByte(dw >> 16);
	tPrintByte(dw >> 8);
	tPrintByte(dw);
	return dw;
}

int __attribute__ ((fastcall)) tPrintByte(int b)
{
	int high = (b % 256) & 0xF0;
	switch (high)
	{
		case 0x00: tPrintChar('0'); break;
		case 0x10: tPrintChar('1'); break;
		case 0x20: tPrintChar('2'); break;
		case 0x30: tPrintChar('3'); break;
		case 0x40: tPrintChar('4'); break;
		case 0x50: tPrintChar('5'); break;
		case 0x60: tPrintChar('6'); break;
		case 0x70: tPrintChar('7'); break;
		case 0x80: tPrintChar('8'); break;
		case 0x90: tPrintChar('9'); break;
		case 0xA0: tPrintChar('A'); break;
		case 0xB0: tPrintChar('B'); break;
		case 0xC0: tPrintChar('C'); break;
		case 0xD0: tPrintChar('D'); break;
		case 0xE0: tPrintChar('E'); break;
		case 0xF0: tPrintChar('F'); break;
		default: break;
	}
	
	int low = (b % 256) & 0x0F;
	switch (low)
	{
		case 0x0: tPrintChar('0'); break;
		case 0x1: tPrintChar('1'); break;
		case 0x2: tPrintChar('2'); break;
		case 0x3: tPrintChar('3'); break;
		case 0x4: tPrintChar('4'); break;
		case 0x5: tPrintChar('5'); break;
		case 0x6: tPrintChar('6'); break;
		case 0x7: tPrintChar('7'); break;
		case 0x8: tPrintChar('8'); break;
		case 0x9: tPrintChar('9'); break;
		case 0xA: tPrintChar('A'); break;
		case 0xB: tPrintChar('B'); break;
		case 0xC: tPrintChar('C'); break;
		case 0xD: tPrintChar('D'); break;
		case 0xE: tPrintChar('E'); break;
		case 0xF: tPrintChar('F'); break;
		default: break;
	}
	
	return b;
}

int __attribute__ ((fastcall)) tPrintChar(int c)
{
	if (c == '\n')
	{
		tTermCurrPosX = 0;
		tTermCurrPosY++;
		
		if (tTermCurrPosY == 25)
		{
			// TODO scroll
			tTermCurrPosY = 0;
		}
		
		return c;
	}
	
	byte *ptr = (byte*) ((tTermCurrPosY * 80 + tTermCurrPosX++) * 2 + 0xb8000);
	ptr[0] = c % 256;
	
	if (tTermCurrPosX == 80)
	{
		tTermCurrPosX = 0;
		tTermCurrPosY++;
		
		if (tTermCurrPosY == 25)
		{
			// TODO scroll
			tTermCurrPosY = 0;
		}
	}
	
	return 0;
}

size_t __attribute__ ((fastcall)) tPrintStr(char *str)
{
	size_t i = 0;
	while(str[i] != '\0')
	{
		tPrintChar(str[i]);
		i++;
	}
	
	return i;
}


