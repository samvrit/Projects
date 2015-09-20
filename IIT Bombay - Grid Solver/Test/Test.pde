
public int x=1,y=0,xf,yf,i=0;
int straight=1,left=0,right=0,reverse=0,back=0;
int xco[]={1,2,3}, yco[]={1,2,3};
void follow_line(int,int,int);
void go_straight(void);
void go_left(void);
void go_right(void);
void sharp_left(void);
void sharp_right(void);
void stop_bot(void);
void reverse1(void);
void check_condition(void);
void show_colour_code(void);
void next_coordinate(void);
int lfl=0,lfc=0,lfr=0;
int tl(void);
int tr(void);
int bl(void);
int br(void);

void setup()
{
    Serial.begin(9600);
}



void loop()
{

    
    Serial.println("LFL: ");
    lfl=Serial.read();
    Serial.print("LFC: ");
    lfc=Serial.read();
    Serial.print("LFR: ");
    lfr=Serial.read();
    follow_line(lfl,lfc,lfr);
        
}



void follow_line(int lfl, int lfc, int lfr)                                                                         //Line follower function
{    
    if((lfl==1)&&(lfc==0)&&(lfr==1))            // Black | White | Black    >>    Go straight  
        go_straight();                                                                     
    else if((lfl==0)&&(lfc==0)&&(lfr==1))       // White | White | Black    >>    Left
        go_left();
    else if((lfl==1)&&(lfc==0)&&(lfr==0))       // Black | White | White    >>    Right
        go_right();
    else if((lfl==0)&&(lfc==0)&&(lfr==0))       // White | White | White    >>    Check Condition
        check_condition();  
    else { Serial.println(lfl); Serial.print(lfc); Serial.print(lfr); delay(2000); }

}



void check_condition()
{
    Serial.println("Check Condition: ");
    if(straight==1) y++;
    if(left==1) if(back==1) {back=0; x++;} else x--;
    if(right==1) if(back==1) {back=0; x--;} else x++;
    if(reverse=1) y--;
    Serial.println("X: "); Serial.print(x); Serial.print(" Y: "); Serial.print(y);
    
    if((x==xf)&&(y=yf))                                              //If coordinates found, show colour.
    {
      show_colour_code();
      next_coordinate();
    }
    
    else
    {
      if(((xf-x)>0)&&((yf-y)>0))
      {
        if(straight==1) sharp_right();
        if(right==1) go_straight();
        if(left==1) reverse1();
        if(reverse==1) sharp_left(); 
      }
      
      if(((xf-x)==0)&&((yf-y)>0))
      {
        if(straight==1) go_straight();
        if(right==1) sharp_left();
        if(left==1) sharp_right();
        if(reverse==1) reverse1(); 
      }
      
      if(((xf-x)<0)&&((yf-y)==0))
      {
        if(straight==1) sharp_left();
        if(right==1) reverse1();
        if(left==1) go_straight();
        if(reverse==1) sharp_right(); 
      }
      
      if(((xf-x)<0)&&((yf-y)>0))
      {
        if(straight==1) sharp_left();
        if(right==1) reverse1();
        if(left==1) go_straight();
        if(reverse==1) sharp_right(); 
      }
      
      if(((xf-x)<0)&&((yf-y)<0))
      {
        if(straight==1) sharp_left();
        if(right==1) reverse1();
        if(left==1) go_straight();
        if(reverse==1) sharp_right(); 
      }
    }
}

void go_straight()                                                     //Go straight function
{
    Serial.println("Straight");   
}

void go_right()                                                        //Go right function
{
    Serial.println("Right Adjust");
}

void go_left()                                                         //Go left function
{
    Serial.println("Left Adjust");
}

void reverse1()                                                         //Go Reverse
{
    back=1;
    Serial.println("Reverse: Back=1");
}

void sharp_right()                                                     //Sharp right function
{
  Serial.println("Sharp Right: ");  
  if(straight==1) {straight=0; right=1; Serial.print("Right=1");}
  else if(right==1) {right=0; reverse=1; Serial.print("Reverse=1");}
  else if(reverse==1) {reverse=0; left=1; Serial.print("Left=1");}
  else if(left==1) {left=0; straight=1; Serial.print("Straight=1");}  

}

void sharp_left()                                                       //Sharp left function
{
  Serial.println("Sharp Left: ");
  if(straight==1) {straight=0; left=1; Serial.print("Left=1");}
  else if(left==1) {left=0; reverse=1; Serial.print("Reverse=1");}
  else if(reverse==1) {reverse=0; right=1; Serial.print("Right=1");}
  else if(right==1) {left=0; straight=1; Serial.print("Straight=1");}   
}

void stop_bot()                                                         //Stop bot function
{
    Serial.println("Stop bot");       
}



void show_colour_code()
{
  Serial.println("Show colour code");
}

void next_coordinate()
{
  Serial.println("Next Coordinates: ");
  xf=xco[i]; yf=yco[i];
  i++;
  Serial.print(xf); Serial.print(","); Serial.print(yf);
}
