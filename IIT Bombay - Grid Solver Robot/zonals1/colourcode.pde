void show_colour_code()
{
  led_enable=1;
  led[0]=0; led[1]=0; led[2]=0; led[3]=0;
  digitalWrite(led1,LOW); digitalWrite(led2,LOW); digitalWrite(led3,LOW); digitalWrite(led4,LOW);
  if(digitalRead(A2)==LOW) { led[0]=1; digitalWrite(led1,HIGH); }
  if(digitalRead(A3)==LOW) { led[1]=1; digitalWrite(led2,HIGH); }
  if(digitalRead(A4)==LOW) { led[2]=1; digitalWrite(led3,HIGH); }
  if(digitalRead(A5)==LOW) { led[3]=1; digitalWrite(led4,HIGH); }
}

