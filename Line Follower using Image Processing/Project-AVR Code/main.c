#include<avr/io.h>	
#include "uart.h"		
#include "lcd118010.h"
#include<util/delay.h>
#include<avr/interrupt.h>
void main()
{
	uart_init();		
    lcd_init();
    int x;
	DDRD=0xF0;
	while(1)
	{

         x=uart_read();
		 _delay_ms(10);
		 PORTD =0X00;
		lcd_gotoxy(1,0);
		lcd_showvalue(x);
		
		if(x==102)		//forward
			PORTD=0xa0;			
		else if(x==108)		//left
			PORTD=0x60;
		else if(x==114)		//right
			PORTD=0x90;
		else PORTD=0x00;		//stop		
		
	}
   		
   
}