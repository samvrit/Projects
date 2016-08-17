#include <SoftwareSerial.h>

int x=0,y=0,flag=0,led=0,led_pin=13;
void setup()
{
  Serial.begin(9600);
  pinMode(led_pin,OUTPUT);
}

void loop()
{
  if((x==0)&&(y==0))
  {
    while(!Serial.available());
    if(Serial.available()>0)
    {
      x = Serial.read();
    }
  }
  
  while(x == 97)
  {
    if(!flag)
    {
      Serial.println("Bike1 selected");
      flag = 1;
    }
    
    Serial.flush();
    y = Serial.read();
    
    if(y == 49)
    {
      Serial.println("Moving bike1 forward");
    }
    else if(y == 50)
    {
      Serial.println("Moving bike1 backward");
    }
    else if(y == 51)
    {
      Serial.println("Moving bike1 leftward");
    }
    else if(y ==52)
    {
      Serial.println("Moving bike1 rightward");
    }
    else if(y == 98)
    {
      x = 98;
      flag = 0;
    }
    else if(y == 99)
    {
      x = 99;
      flag = 0;
    }
    else if(y == 100)
    {
      x = 100;
      flag = 0;
    }
  }
  
  while(x == 98)
  {
    if(!flag)
    {
      Serial.println("Bike2 selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = Serial.read();
    
    if(y == 49)
    {
      Serial.println("Moving bike2 forward");
    }
    else if(y == 50)
    {
      Serial.println("Moving bike2 backward");
    }
    else if(y == 51)
    {
      Serial.println("Moving bike2 leftward");
    }
    else if(y ==52)
    {
      Serial.println("Moving bike2 rightward");
    }
    else if(y == 97)
    {
      x = 97;
      flag = 0;
    }
    else if(y == 99)
    {
      x = 99;
      flag = 0;
    }
    else if(y == 100)
    {
      x = 100;
      flag = 0;
    }
  }
  
  while(x == 99)
  {
    if(!flag)
    {
      Serial.println("Both bikes selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = Serial.read();
    
    if(y == 49)
    {
      Serial.println("Moving both bikes forward");
    }
    else if(y == 50)
    {
      Serial.println("Moving both bikes backward");
    }
    else if(y == 51)
    {
      Serial.println("Moving both bikes leftward");
    }
    else if(y ==52)
    {
      Serial.println("Moving both bikes rightward");
    }
    else if(y == 97)
    {
      x = 97;
      flag = 0;
    }
    else if(y == 98)
    {
      x = 98;
      flag = 0;
    }
    else if(y == 100)
    {
      x = 100;
      flag = 0;
    }
  }
  
  while(x == 100)
  {
    if(!flag)
    {
      Serial.println("Main vehicle selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = Serial.read();
    
    if(y == 49)
    {
      Serial.println("Moving main vehicle forward");
    }
    else if(y == 50)
    {
      Serial.println("Moving main vehicle backward");
    }
    else if(y == 51)
    {
      Serial.println("Moving main vehicle leftward");
    }
    else if(y == 52)
    {
      Serial.println("Moving main vehicle rightward");
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON");
      digitalWrite(led_pin,HIGH);
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF");
      digitalWrite(led_pin,LOW);
    }
    else if(y == 97)
    {
      x = 97;
      flag = 0;
    }
    else if(y == 98)
    {
      x = 98;
      flag = 0;
    }
    else if(y == 99)
    {
      x = 99;
      flag = 0;
    }
  }

}

