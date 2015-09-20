void readcard()
{
  if (RC522.isCard())
  {
    
    delay(50);
    byte i;
    RC522.readCardSerial();
    String ser="";
    for(i = 0; i <= 4; i++)
    {
      String x =String(RC522.serNum[i]);
      ser = ser + x;
    }

    String loc="1";
    String request ="GET " + repository + "test.php?CardID=" + ser + "&Loc=" + loc;
    Serial.println(request);

    send_request(request);

    Serial.print(ser);
    Serial.println();
    
  }
}

