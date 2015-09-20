#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 13, 8, 3, 2);
int pwm_val=80;

void setup() {
 pinMode(9,OUTPUT);
 pinMode(10,OUTPUT);
 pinMode(4,OUTPUT);
 pinMode(5,OUTPUT);
 pinMode(6,OUTPUT);
 pinMode(7,OUTPUT); 
  lcd.begin(16, 2);
  Serial.begin(9600);
}

void loop() {
  Serial.println();
  Serial.print(analogRead(A3));
  Serial.print("\t");
  Serial.print(analogRead(A0));
  Serial.print("\t");
  Serial.print(analogRead(A1));
  Serial.print("\t");
  Serial.print(analogRead(A2));
  Serial.print("\t");
  Serial.print(analogRead(A4));
  lcd.setCursor(0, 0);
  lcd.print(analogRead(A4));
  lcd.setCursor(4, 0);
  lcd.print(digitalRead(A2));
  lcd.setCursor(6, 0);
  lcd.print(digitalRead(A1));
  lcd.setCursor(8, 0);
  lcd.print(digitalRead(A0));
  lcd.setCursor(10, 0);
  lcd.print(analogRead(A3));  
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
//  else if((digitalRead(A3)==1)&&(digitalRead(A4)==1))
//    stop_bot();
}
