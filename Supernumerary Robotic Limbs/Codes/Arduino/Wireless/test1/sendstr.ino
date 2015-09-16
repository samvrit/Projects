int sendstr(String theMessage)
{
  int messageSize = theMessage.length();
  radio.powerUp();
  delay(1);
  for (int i = 0; i < messageSize; i++) {
    int charToSend[1];
    charToSend[0] = theMessage.charAt(i);
    radio.write(charToSend,1);
  }  
//send the 'terminate string' value...  
  msg[0] = '\n'; 
  radio.write(msg,1);
/*delay sending for a short period of time.  radio.powerDown()/radio.powerupp
//with a delay in between have worked well for this purpose(just using delay seems to
//interrupt the transmission start). However, this method could still be improved
as I still get the first character 'cut-off' sometimes. I have a 'checksum' function
on the receiver to verify the message was successfully sent.
*/
  radio.powerDown();
  delay(5);
  //radio.powerUp();
  return 1;
}
