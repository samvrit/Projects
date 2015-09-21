#include <SPI.h>
#include <RFID.h>
#define SDAPIN 10
#define RESETPIN 5

RFID RC522(SDAPIN, RESETPIN); 

void setup()
{ 
    Serial.begin(9600);
    SPI.begin(); 
    RC522.init();
}

void loop()
{
    readcard();
}
