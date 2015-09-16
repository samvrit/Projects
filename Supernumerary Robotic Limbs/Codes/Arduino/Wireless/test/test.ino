#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
#include <RF24_config.h>
 
/*
This sketch sends a string to a corresponding Arduino
with nrf24 attached.  It appends a specific value 
(2 in this case) to the end to signify the end of the
message.
*/
 
char msg[1];
RF24 radio(9,10);
const uint64_t pipe = 0xE8E8F0F0E1LL;
String str = "";
String theMessage = "";
int y = 0;
void setup(void)
{
  Serial.begin(9600);
  radio.begin();
  radio.openWritingPipe(pipe);
}

void loop(void){
  while(Serial.available()>0)
  {
    str = Serial.readStringUntil('\n');
  }
  if(str!="")
  {
    y = sendstr(str);
    Serial.println(str);
  }
  if(y)
  {
    Serial.println("Sent...");
    str = "";
    y = !y;
  }


}
