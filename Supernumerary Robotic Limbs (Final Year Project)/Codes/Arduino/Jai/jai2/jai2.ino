void setup()
{
 Serial.begin(9600); 
 delay(5000);
 Serial.println("P0");
 delay(500);
}

void loop()
{
  delay(1500); 
  Serial.println("G-840");
  delay(4000);
  Serial.println("G0");
  delay(4100);
  
}
