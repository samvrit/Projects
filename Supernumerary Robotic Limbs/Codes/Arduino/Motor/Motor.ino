#include <SoftwareSerial.h>

// Buffer to store incoming commands from serial port
String inData;
String num;
int flag=0, count;
String command="";

void setup() {
    Serial.begin(9600);
    //Serial.println("Serial conection started, waiting for instructions...");
    
    //motor1.begin(9600);
    Serial.println("P0");
    Serial.println("M255");
}  

void loop() {
  if(!flag)
  {
   count = 1800;
   command = "G"+String(count);
   Serial.println(command);
   while(getPos()!=count)
    {} 
    flag = !flag;
    command = "";
  }
  if(flag)
  {
   count = 0;
   command = "G"+String(count);
   Serial.println(command);
   while(getPos()!=count)
    {} 
    flag = !flag;
    command = "";
  }
    
  
//    while (Serial.available() > 0)
//    {
//        char recieved = Serial.read();
//        inData += recieved; 
//        
//        // Process message when new line character is recieved
//        if (recieved == '\n')
//        {
//            Serial.print("Arduino Received: ");
//            
//            num = inData.substring(2);
//            num1 = num.toInt();
//            num1++;
//            Serial.println(num1);
//
//            
//            inData = ""; // Clear recieved buffer
//        }
//    }
}
