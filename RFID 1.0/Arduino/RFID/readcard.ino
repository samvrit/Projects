void readcard()
{
  if (RC522.isCard())
  {
    delay(50);
    byte i;
    RC522.readCardSerial();
    for(i = 0; i <= 4; i++)
    {
      Serial.print(RC522.serNum[i],DEC);
    }
    Serial.println();
    delay(2000);
  }
}

