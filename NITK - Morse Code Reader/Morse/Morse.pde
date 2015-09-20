#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,13,8,3,2);

int pwm_val=80;
int timer=0, counter=0, set_value=10000, sum=0, compare=1, i=0, time;
int a[]={0,0,0,0,0};
int codes[10][5]={
  {1,1,1,1,1},
  {0,1,1,1,1},
  {0,0,1,1,1},
  {0,0,0,1,1},
  {0,0,0,0,1},
  {0,0,0,0,0},
  {1,0,0,0,0},
  {1,1,0,0,0},
  {1,1,1,0,0},
  {1,1,1,1,0}
};

void setup()
{
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  Serial.begin(9600);
  lcd.begin(16, 2);
}

void loop()
{
//  lcd.setCursor(0, 0);
//  lcd.print(digitalRead(A4));
//  lcd.setCursor(2, 0);
//  lcd.print(digitalRead(A2));
//  lcd.setCursor(4, 0);
//  lcd.print(digitalRead(A1));
//  lcd.setCursor(6, 0);
//  lcd.print(digitalRead(A0));
//  lcd.setCursor(8, 0);
//  lcd.print(digitalRead(A3));  
  if((digitalRead(A3)==0)&&(digitalRead(A4)==0))
    follow_line(digitalRead(A0),digitalRead(A1),digitalRead(A2));
  else if((digitalRead(A3)!=0)&&(digitalRead(A4)!=1))
    {      
//      if(((digitalRead(A0)==1)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))||((digitalRead(A0)==0)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))) stop_bot();
      check_counter();
      turn_left();
    }
  else if((digitalRead(A3)!=1)&&(digitalRead(A4)!=0))
    {      
//      if(((digitalRead(A0)==1)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))||((digitalRead(A0)==0)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))) stop_bot();      
      check_counter();
      turn_right();
    }
   else if((digitalRead(A3)==1)&&(digitalRead(A4)==1))
    {
      stop_bot();
    }
}
