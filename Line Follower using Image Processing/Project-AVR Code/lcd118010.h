/***************************************************************************************************************************************************
HEADER:LCD.h 
****************************************************************************************************************************************************

*COPYRIGHT(c): Technophilia embedded systems.
*AUTHOR: Technophilia
*Target system: AVR devlopment board s/n-118010
*Manufacturer: Technophilia 
*Microcontroller: ATmega-8
*Clock: 12MHz
*COMPILER: WinAVR
	

DESCRIPTION: 
	This header files have implementation of some common finctions of the LCD.
	Include this header file in your C code. Call the lcd_init() function before
	calling any other functions to initialize the lcd.


	lcd_init() ----- Call the lcd_init() function before calling any other functions
			  to initialize the lcd.
	lcd_cmd() ------ This function is used to give any command instructions to the
			  LCD. For e.g lcd_cmd(0x01) will give the clear command.
	lcd_char() ----- This function will display a single character on the LCD display.
			  For example lcd_char(0x61) will display A. Again lcd_char('b')
			  will display b.
	lcd_string()---- This function will display a string. An example of this would be
			  like lcd_string("This is AVR")
	lcd_showvalue()- This will show a 3-digit decimal value on the LCD. For example if
			  we give lcd_showvalue(0xFF) then 255 will be displayed.
	lcd_gotoxy()--- Will set the cursor at a particular position on of the LCD.
			  So lcd_gotoxy(1,4) will set the cursor at the 2d row 3rd column
			  row and column address are starts from(0,0)
	lcd_clear()---To clear the LCD
	
*/

#ifndef _LCD_H_
#define _LCD_H_


unsigned char k=0,j=0;
unsigned char save=0;

void lcd_init(void);
void lcd_cmd(unsigned char cmd);
void latch(void);
void dely_ns(unsigned char tim);
void lcd_char(unsigned char single);
void lcd_string(unsigned char str[32]);
void lcd_showvalue(unsigned char num);
void lcd_gotoxy(unsigned char row,unsigned char column);
void delay_ms(unsigned int ms);
void lcd_clear();

void lcd_init(void)	//init the lcd
{	
	delay_ms(20);
	save=PORTB;
	DDRB=0x3F;
	delay_ms(15);
	PORTB=0x02;			//interface setup		
	lcd_cmd(0x01);
	lcd_cmd(0x02);
	lcd_cmd(0X80);
	delay_ms(20);
}

void latch(void)
{
PORTB&=~0x20;
dely_ns(200);  
PORTB|=0x20;
dely_ns(200);  
PORTB&=~0x20;
}

void dely_ns(unsigned char tim)
{
	for(j=0;j<tim;j++)
	{
		for(k=0;k<11;k++)
		{};
	}
}

void lcd_cmd(unsigned char cmd)
{   unsigned char cmd_temp=cmd;
	PORTB&=~0x30;
	cmd_temp>>=4;
	PORTB=((cmd_temp & 0x0F));			
	latch();
	PORTB=(cmd & 0x0F);	
	latch();
}


void lcd_char(unsigned char single)
{
    unsigned char temp_single=single;
	temp_single>>=4;
	PORTB=0x10;
	PORTB=0x00;
	PORTB=(temp_single & 0x0F)|0x10;						
	latch();
	PORTB=(single & 0x0F)|0x10;
	latch();
}

void lcd_string(unsigned char *str)
{
	unsigned char k=0;

		while(*str!='\0')	//Till null character is encountered
		{
			lcd_char(*str);
			str++;
		}
}



void lcd_showvalue(unsigned char num)	//prints the decimal 3digit value of num
{
	unsigned char H=0,T=0,O=0;
	H=num/100;
	T=(num - (H*100))/10;
	O=(num - (H*100) - (T*10));
	
	lcd_char(H+48);
	lcd_char(T+48);
	lcd_char(O+48);
}

void lcd_gotoxy(unsigned char row,unsigned char column)			//move cursor to the specified position
{
   if(row==0)
    {
	 lcd_cmd(0x80+column);
	}
   else if(row==1)
	{
	 lcd_cmd(0xC0+column);	
	}	
}


void delay_ms(unsigned int ms)
{
	int i;

	while (ms-- > 0)
	{
		
		for (i = 0; i < 3276; ++i)
			asm("nop");
	}
}

void lcd_clear()
{
 lcd_cmd(0x01);
}
#endif 