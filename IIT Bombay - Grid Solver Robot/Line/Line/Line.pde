
void setup() {
  // initialize the serial communication:
  
  Serial.begin(9600);
}

void loop() {
  Serial.println();
  Serial.print(analogRead(A0));
  Serial.print("\t");
  Serial.print(analogRead(A1));
//  Serial.print("\t");
//  Serial.print(analogRead(A2));
//  Serial.print("\t");
  if((analogRead(A0)==0)&&(analogRead(A1)==0))
  { Serial.println(); Serial.println(); Serial.println(); Serial.println(); Serial.println(); }
  delay(10);
}
