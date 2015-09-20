void go_straight()
{
  analogWrite(9,pwm_val);
  analogWrite(10,pwm_val);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}

void go_left()
{
  analogWrite(9,0);
  analogWrite(10,pwm_val-20);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}

void go_right()
{
  analogWrite(9,pwm_val-20);
  analogWrite(10,0);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}


void turn_left()
{
  while(digitalRead(A3)!=0)
    left();
  while(digitalRead(A0)!=1)
    go_left();
  while(digitalRead(A0)!=0)
    go_left();
  while(digitalRead(A2)!=0)
    go_right();
}

void turn_right()
{
  while(digitalRead(A4)!=0)
    right();
  while(digitalRead(A2)!=1)
    go_right();
  while(digitalRead(A2)!=0)
    go_right();
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
  analogWrite(9,pwm_val-20);
  analogWrite(10,pwm_val-20);
  digitalWrite(4,HIGH);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH); 
//  delay(10);
//  analogWrite(10,pwm_val-20);
//  digitalWrite(4,LOW);
//  digitalWrite(5,HIGH);
//  digitalWrite(6,LOW);
//  digitalWrite(7,HIGH);
}

void right()
{
  analogWrite(9,pwm_val-20);
  analogWrite(10,pwm_val-20);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,HIGH);
  digitalWrite(7,LOW);  
//  delay(10);
//  analogWrite(9,pwm_val-20);
//  analogWrite(10,0);
//  digitalWrite(4,LOW);
//  digitalWrite(5,HIGH);
//  digitalWrite(6,LOW);
//  digitalWrite(7,HIGH);
}
