#include <tterm.h>

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

int tPrintChar(int c)
{
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
