void setup()
{
 Serial.begin(9600);
 delay(5000);
 Serial.println("P0");
 delay(500); 
}

void loop()
{
 Serial.println("G-450");
 delay(11000);
 Serial.println("G0");
 delay(6000); 
}
