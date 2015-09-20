void send_request (String request) {

  
  Serial.println("Starting connection to server...");
    Adafruit_CC3000_Client client = cc3000.connectTCP(ip, port);
    
    if (client.connected()) {
      client.println(request);      
      client.println(F(""));
      Serial.println("Connected & Data sent");
    } 
    else {
      Serial.println(F("Connection failed"));    
    }

    while (client.connected()) {
      while (client.available()) {

      // Read answer
      char c = client.read();
      int a=int(c);
      Serial.println(a);
      if(a==50)
      {
      digitalWrite(26,HIGH);
      delay(2000);
      digitalWrite(26,LOW);
      }
      if(a==49)
      {
        digitalWrite(22,HIGH);
        delay(2000);
        digitalWrite(22,LOW);
      }
      }
    }
    Serial.println("Closing connection");
    Serial.println("");
    client.close();
    
}
