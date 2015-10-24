void go_straight()
{
  analogWrite(9,pwm_val);
  analogWrite(10,pwm_val);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
  if(straight==1) delay(200);
}

void go_left()
{
  analogWrite(9,0);
  analogWrite(10,pwm_val-10);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}

void go_right()
{
  analogWrite(9,pwm_val-10);
  analogWrite(10,0);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}


void turn_left()
{
  straight=1;
  go_straight();
  if(digitalRead(A4)!=1)
  while(digitalRead(A3)!=1)
    left();
  if(digitalRead(A4)!=1)
  while(digitalRead(A3)!=0)
    left();
  if(digitalRead(A4)!=1)  
  while(digitalRead(A0)!=1)
    go_left();
  if(digitalRead(A4)!=1)  
  while(digitalRead(A0)!=0)
    go_left();
  if(digitalRead(A4)!=1)  
  while(digitalRead(A2)!=0)
    go_right();
}

void turn_right()
{
  straight=1;
  go_straight();
  if(digitalRead(A3)!=1)
  while(digitalRead(A4)!=1)
    right();
  if(digitalRead(A3)!=1)
  while(digitalRead(A4)!=0)
    right();
  if(digitalRead(A3)!=1)
  while(digitalRead(A2)!=1)
    go_right();
  if(digitalRead(A3)!=1)
  while(digitalRead(A2)!=0)
    go_right();
  if(digitalRead(A3)!=1)
  while(digitalRead(A0)!=0)
    go_left();  
}

void stop_bot()
{
  analogWrite(9,0);
  analogWrite(10,0);
  digitalWrite(4,LOW);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(7,LOW);  
  while(1);
}

void left()
{
  analogWrite(9,pwm_val-10);
  analogWrite(10,pwm_val-10);
  digitalWrite(4,HIGH);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH); 
}

void right()
{
  analogWrite(9,pwm_val-10);
  analogWrite(10,pwm_val-10);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,HIGH);
  digitalWrite(7,LOW);  
}
