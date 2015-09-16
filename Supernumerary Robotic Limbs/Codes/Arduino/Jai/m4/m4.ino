void setup()
{
 Serial.begin(9600); 
 delay(5000);
Serial.println("P0");
delay(500);
 Serial.println("M255");
 delay(500);
}

void loop()
{
  Serial.println("G-450");//2580
  delay(4700);
  Serial.println("G0");//2580
  delay(2750);
  Serial.println("G-450");//2580
  delay(2750);
  Serial.println("G0");//2580
  delay(2580);
  Serial.println("G-450");//2580
  delay(2580);
  Serial.println("G0");//2580
  delay(2580+4000);
}
