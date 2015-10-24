
int pwm_val=60;
int x=1,y=0,xf=1,yf=2,i=0;
int lfl,lfr,lfc;
int straight=1,left=0,right=0,reverse=0,back=0,coordinate=0,pass=0;
int led1=4,led2=5,led3=6,led4=7, led[]={0,0,0,0},led_enable=0;
int xco[]={2,1,2}, yco[]={3,1,4};


void setup()
{
    pinMode(9,OUTPUT);
    pinMode(10,OUTPUT);
    pinMode(11,OUTPUT);
    pinMode(12,OUTPUT);
    pinMode(2,OUTPUT);
    pinMode(3,OUTPUT);
    pinMode(led1,OUTPUT);
    pinMode(led2,OUTPUT);
    pinMode(led3,OUTPUT);
    pinMode(led4,OUTPUT);
    Serial.begin(9600);
}



void loop()
{
    if(led_enable==1)
    {
     if(led[0]==1) digitalWrite(led1,HIGH); 
     if(led[1]==1) digitalWrite(led2,HIGH); 
     if(led[2]==1) digitalWrite(led3,HIGH); 
     if(led[3]==1) digitalWrite(led4,HIGH); 
    }
    follow_line(digitalRead(A0),digitalRead(A1));
        
}


