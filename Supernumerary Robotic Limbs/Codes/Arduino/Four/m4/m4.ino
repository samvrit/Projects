void setup()
{
  Serial.begin(9600);
  delay(5000);
  Serial.println("P0");
  delay(500);
}

void loop()
{
 delay(2500);
 Serial.println("G-470");
 delay(2000);
 Serial.println("G0");
 delay(2000);
 Serial.println("G-470");
 delay(2000);
 Serial.println("G0");
 delay(8200); 
}
