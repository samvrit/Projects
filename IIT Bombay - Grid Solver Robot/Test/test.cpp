#include<stdio.h>
#include<conio.h>

int x=1,y=0,xf=1,yf=1,i=0;
int straight=1,left=0,right=0,reverse=0,back=0;
int xco[]={2,1,2,2}, yco[]={2,2,2,4};
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
void change_dir(void);
int lfl,lfc,lfr;
int tl(void);
int tr(void);
int bl(void);
int br(void);


void main()
{

    while(1){
	printf("\nMain\n");
    printf("LFL: ");
    scanf("%d",&lfl);
    printf("LFC: ");
    scanf("%d",&lfc);
    printf("LFR: ");
    scanf("%d",&lfr);
    follow_line(lfl,lfc,lfr);
	}
        
}



void follow_line(int lfl, int lfc, int lfr)                                                                         //Line follower function
{    
    printf("\nFollow Line\n");
	if((lfl==1)&&(lfc==0)&&(lfr==1))            // Black | White | Black    >>    Go straight  
        go_straight();                                                                     
    else if((lfl==0)&&(lfc==0)&&(lfr==1))       // White | White | Black    >>    Left
        go_left();
    else if((lfl==1)&&(lfc==0)&&(lfr==0))       // Black | White | White    >>    Right
        go_right();
    else if((lfl==0)&&(lfc==0)&&(lfr==0))       // White | White | White    >>    Check Condition
        check_condition();  
    else { printf("%d %d %d",lfl,lfc,lfr); }

}



void check_condition()
{
    printf("Check Condition: ");
    if(straight==1) y++;
    if(left==1) if(back==1) {back=0; x++;} else x--;
    if(right==1) if(back==1) {back=0; x--;} else x++;
    if(reverse==1) y--;
    printf("X: %d Y: %d",x,y);
    
    if((x==xf)&&(y==yf))                                              //If coordinates found, show colour.
    {
      if((x==2)&&(y==4)) { stop_bot(); }
	  else {
	  show_colour_code();
      next_coordinate();
	  change_dir();
	  }
    }
    
    else
    {
      change_dir();
    }
}

void change_dir()
{
	printf("\nChange direction");
	if(((xf-x)>0)&&((yf-y)>0))
      {
        if(straight==1) sharp_right();
        else if(right==1) go_straight();
        else if(left==1) reverse1();
        else if(reverse==1) sharp_left(); 
      }
	
	if(((xf-x)>0)&&((yf-y)==0))
      {
        if(straight==1) sharp_right();
        else if(right==1) go_straight();
        else if(left==1) reverse1();
        else if(reverse==1) sharp_left(); 
      }
      
      if(((xf-x)==0)&&((yf-y)>0))
      {
        if(straight==1) go_straight();
        else if(right==1) sharp_left();
        else if(left==1) sharp_right();
        else if(reverse==1) reverse1(); 
      }
      
      if(((xf-x)<0)&&((yf-y)==0))
      {
        if(straight==1) sharp_left();
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) sharp_right(); 
      }
      
      if(((xf-x)<0)&&((yf-y)>0))
      {
        if(straight==1) sharp_left();
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) sharp_right(); 
      }
      
      if(((xf-x)<0)&&((yf-y)<0))
      {
        if(straight==1) sharp_left();
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) sharp_right(); 
      }
}

void go_straight()                                                     //Go straight function
{
    printf("\nStraight");   
}

void go_right()                                                        //Go right function
{
    printf("Right Adjust");
}

void go_left()                                                         //Go left function
{
    printf("Left Adjust");
}

void reverse1()                                                         //Go Reverse
{
    back=1;
    printf("\nReverse: Back=1");
}

void sharp_right()                                                     //Sharp right function
{
  printf("\nSharp Right: ");  
  if(straight==1) {straight=0; right=1; printf("Right=1");}
  else if(right==1) {right=0; reverse=1; printf("Reverse=1");}
  else if(reverse==1) {reverse=0; left=1; printf("Left=1");}
  else if(left==1) {left=0; straight=1; printf("Straight=1");}  

}

void sharp_left()                                                       //Sharp left function
{
  printf("\nSharp Left: ");
  if(straight==1) {straight=0; left=1; printf("Left=1");}
  else if(left==1) {left=0; reverse=1; printf("Reverse=1");}
  else if(reverse==1) {reverse=0; right=1; printf("Right=1");}
  else if(right==1) {right=0; straight=1; printf("Straight=1");}   
}

void stop_bot()                                                         //Stop bot function
{
    printf("\nStop bot");       
}



void show_colour_code()
{
  printf("\nShow colour code");
}

void next_coordinate()
{
  printf("\nNext Coordinates: ");
  xf=xco[i]; yf=yco[i];
  i++;
  printf("Xf: %d Yf: %d ",xf,yf);
}