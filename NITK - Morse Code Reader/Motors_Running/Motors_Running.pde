int pwm_val=100;
void setup()
{
 pinMode(9,OUTPUT);
 pinMode(10,OUTPUT);
 pinMode(4,OUTPUT);
 pinMode(5,OUTPUT);
 pinMode(6,OUTPUT);
 pinMode(7,OUTPUT); 

}

void loop()
{
  analogWrite(9,pwm_val);
  analogWrite(10,pwm_val-50);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
}
