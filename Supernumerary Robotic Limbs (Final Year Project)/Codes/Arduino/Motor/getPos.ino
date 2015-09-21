int getPos()
{
  int num1=0;
  Serial.println("P");
  while (Serial.available() > 2)
    {
        char recieved = Serial.read();
        inData += recieved; 
        // Process message when new line character is recieved
        if (recieved == '\r')
        {
            
            num = inData.substring(2);
            num1 = num.toInt();
            

            
            inData = ""; // Clear recieved buffer
        }
        
    }
    return num1;
}
