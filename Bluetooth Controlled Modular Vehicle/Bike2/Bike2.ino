#include <SoftwareSerial.h>
SoftwareSerial bike2(A0,A1);

int x=0,y=0,flag=0;
void setup()
{
  Serial.begin(9600);
  bike2.begin(9600);
  bike2.listen();
  pinMode(13,OUTPUT);
  
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
}

void loop()
{
  if(bike2.available()>0)
  {
    y = bike2.read();
    if(y == 48)
    {
      Serial.println("Stopping Bike2");
      analogWrite(9,0);
      analogWrite(10,0);
    }
    else if(y == 49)
    {
      Serial.println("Moving bike2 forward");
      analogWrite(9,255);
      analogWrite(10,255);
      digitalWrite(4,LOW);
      digitalWrite(5,HIGH);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y == 50)
    {
      Serial.println("Moving bike2 backward");
      analogWrite(9,255);
      analogWrite(10,255);
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,LOW);
      digitalWrite(7,HIGH);
    }
    else if(y == 51)
    {
      Serial.println("Moving bike2 leftward");
      analogWrite(9,255);
      analogWrite(10,255);
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y ==52)
    {
      Serial.println("Moving bike2 rightward");
      analogWrite(9,255);
      analogWrite(10,255);
      digitalWrite(4,LOW);
      digitalWrite(5,HIGH);
      digitalWrite(6,LOW);
      digitalWrite(7,HIGH);
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON");
      digitalWrite(13,HIGH);      
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF");
      digitalWrite(13,LOW);      
    }
  }
}

