#include <SoftwareSerial.h>

SoftwareSerial mainvehicle(A4,A5); //RX, TX
SoftwareSerial bike1(A0,A1); //RX, TX
SoftwareSerial bike2(A2,A3); //RX, TX

int x=0,y=0,flag=0,led=0,led_pin=13;
void setup()
{
  Serial.begin(9600);
  pinMode(led_pin,OUTPUT);
  mainvehicle.begin(9600);
  bike1.begin(9600);
  bike2.begin(9600);
  while(!Serial);
  
  mainvehicle.listen();
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
}

void loop()
{
  if((x==0)&&(y==0))
  {
    while(!mainvehicle.available());
    if(mainvehicle.available()>0)
    {
      x = mainvehicle.read();
    }
  }
  
  while(x == 97)
  {
    if(!flag)
    {
      Serial.println("Bike1 selected");
      mainvehicle.println("Bike1 selected");
      flag = 1;
    }
    
    Serial.flush();
    y = mainvehicle.read();
    
    if(y == 48)
    {
      Serial.println("Stopping bike1");
      bike1.write(y);
      mainvehicle.println("Stopping bike");
      Serial.println("Done");
    }
    else if(y == 49)
    {
      Serial.println("Moving bike1 forward");
      bike1.write(y);
      mainvehicle.println("Moving bike1 forward");
      Serial.println("Done");
    }
    else if(y == 50)
    {
      Serial.println("Moving bike1 backward");
      bike1.write(y);
      mainvehicle.println("Moving bike1 backward");
      Serial.println("Done");
    }
    else if(y == 51)
    {
      Serial.println("Moving bike1 leftward");
      bike1.write(y);
      mainvehicle.println("Moving bike1 leftward");
      Serial.println("Done");
    }
    else if(y ==52)
    {
      Serial.println("Moving bike1 rightward");
      bike1.write(y);
      mainvehicle.println("Moving bike1 rightward");
      Serial.println("Done");
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON on bike1");
      bike1.write(y);
      mainvehicle.println("LEDs ON on bike1");
      Serial.println("Done");
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF on bike1");
      bike1.write(y);
      mainvehicle.println("LEDs OFF on bike1");
      Serial.println("Done");
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
      mainvehicle.println("Bike2 selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = mainvehicle.read();
    
    if(y == 48)
    {
      Serial.println("Stopping bike2");
      bike2.write(y);
      mainvehicle.println("Stopping bike2");
      Serial.println("Done");
    }
    else if(y == 49)
    {
      Serial.println("Moving bike2 forward");
      bike2.write(y);
      mainvehicle.println("Moving bike2 forward");
      Serial.println("Done");
    }
    else if(y == 50)
    {
      Serial.println("Moving bike2 backward");
      bike2.write(y);
      mainvehicle.println("Moving bike2 backward");
      Serial.println("Done");
    }
    else if(y == 51)
    {
      Serial.println("Moving bike2 leftward");
      bike2.write(y);
      mainvehicle.println("Moving bike2 leftward");
      Serial.println("Done");
    }
    else if(y ==52)
    {
      Serial.println("Moving bike2 rightward");
      bike2.write(y);
      mainvehicle.println("Moving bike2 rightward");
      Serial.println("Done");
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON on bike2");
      bike2.write(y);
      mainvehicle.println("LEDs ON on bike2");
      Serial.println("Done");
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF on bike2");
      bike2.write(y);
      mainvehicle.println("LEDs OFF on bike2");
      Serial.println("Done");
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
      mainvehicle.println("Both bikes selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = mainvehicle.read();
    
    if(y == 48)
    {
      Serial.println("Stopping both bikes");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("Stopping both bikes");
      Serial.println("Done");
    }
    else if(y == 49)
    {
      Serial.println("Moving both bikes forward");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("Moving both bikes forward");
      Serial.println("Done");
    }
    else if(y == 50)
    {
      Serial.println("Moving both bikes backward");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("Moving both bikes backward");
      Serial.println("Done");
    }
    else if(y == 51)
    {
      Serial.println("Moving both bikes leftward");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("Moving both bikes leftward");
      Serial.println("Done");
    }
    else if(y ==52)
    {
      Serial.println("Moving both bikes rightward");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("Moving both bikes rightward");
      Serial.println("Done");
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON on both bikes");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("LEDs ON on both bikes");
      Serial.println("Done");
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF on both bikes");
      bike1.write(y);
      bike2.write(y);
      mainvehicle.println("LEDs OFF on both bikes");
      Serial.println("Done");
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
      mainvehicle.println("Main vehicle selected");
      flag = 1;
    }
    
    Serial.flush();
    
    y = mainvehicle.read();
    
    if(y == 48)
    {
      Serial.println("Stopping main vehicle");
      mainvehicle.println("Stopping main vehicle");
      analogWrite(9,0);  //left motor pwm
      analogWrite(10,0);  //right motor pwm
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y == 49)
    {
      Serial.println("Moving main vehicle forward");
      mainvehicle.println("Moving main vehicle forward");
      analogWrite(9,255);  //left motor pwm
      analogWrite(10,255);  //right motor pwm
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y == 50)
    {
      Serial.println("Moving main vehicle backward");
      mainvehicle.println("Moving main vehicle backward");
      analogWrite(9,255);  //left motor pwm
      analogWrite(10,255);  //right motor pwm
      digitalWrite(4,LOW);
      digitalWrite(5,HIGH);
      digitalWrite(6,LOW);
      digitalWrite(7,HIGH);
    }
    else if(y == 51)
    {
      Serial.println("Moving main vehicle leftward");
      mainvehicle.println("Moving main vehicle leftward");
      analogWrite(9,0);  //left motor pwm
      analogWrite(10,255);  //right motor pwm
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y == 52)
    {
      Serial.println("Moving main vehicle rightward");
      mainvehicle.println("Moving main vehicle rightward");
      analogWrite(9,255);  //left motor pwm
      analogWrite(10,0);  //right motor pwm
      digitalWrite(4,HIGH);
      digitalWrite(5,LOW);
      digitalWrite(6,HIGH);
      digitalWrite(7,LOW);
    }
    else if(y == 53)
    {
      Serial.println("LEDs ON");
      mainvehicle.println("LEDs ON");
      digitalWrite(led_pin,HIGH);
    }
    else if(y == 54)
    {
      Serial.println("LEDs OFF");
      mainvehicle.println("LEDs OFF");
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

