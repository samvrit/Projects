#include <LiquidCrystal.h>
LiquidCrystal lcd(12,11,13,8,3,2);

int pwm_val=160;
int timer=0, counter=0, set_value=5000, sum=0, compare=1, i=0, time;
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
  if((digitalRead(A3)==0)&&(digitalRead(A4)==0))
    follow_line(digitalRead(A0),digitalRead(A1),digitalRead(A2));
  else if((digitalRead(A3)!=0)&&(digitalRead(A4)!=1))
    {      
      check_counter();
      turn_left();
    }
  else if((digitalRead(A3)!=1)&&(digitalRead(A4)!=0))
    {      
      check_counter();
      turn_right();
    }
   else if((digitalRead(A3)==1)&&(digitalRead(A4)==1))
    {
      stop_bot();
    }
}
