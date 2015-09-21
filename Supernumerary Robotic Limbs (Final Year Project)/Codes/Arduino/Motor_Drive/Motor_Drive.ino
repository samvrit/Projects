void setup()
{
 Serial.begin(9600); 
 Serial.println("P0");
 delay(200);
 Serial.println("M255");
 delay(200);
 Serial.println("S0");
 delay(2000);
}
void loop()
{
  Serial.println("G225");
  delay(2500);
  Serial.println("G-225");
  delay(8000);
}
