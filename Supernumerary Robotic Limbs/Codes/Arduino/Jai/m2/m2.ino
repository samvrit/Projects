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
  Serial.println("G-860");//4700
  delay(4700+2750+2750+2580);
  Serial.println("G0");//3100
  delay(2580+2580+4000);
  
}
