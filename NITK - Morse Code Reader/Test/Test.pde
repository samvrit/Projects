#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,13,8,3,2);

int counter=0, timer=0, pwm_val=110, set_value=7500;
void setup()
{
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(4,OUTPUT); 
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  Serial.begin(9600);
  lcd.begin(16,2);
}

void loop()
{
  if((digitalRead(A3)==0)&&(digitalRead(A4)==0))
    follow_line(digitalRead(A0),digitalRead(A1),digitalRead(A2));
  else if((digitalRead(A3)==1)&&(digitalRead(A4)==0))
    {
//      if(((digitalRead(A0)==1)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))||((digitalRead(A0)==0)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))) stop_bot(); 
      turn_left();
    }
  else if((digitalRead(A3)==0)&&(digitalRead(A4)==1))
    {
//      if(((digitalRead(A0)==1)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))||((digitalRead(A0)==0)&&(digitalRead(A1)==1)&&(digitalRead(A2)==1))) stop_bot(); 
      turn_right();
    }
  else if((digitalRead(A3)==1)&&(digitalRead(A4)==1))
    stop_bot();
}
