void follow_line(int lfl, int lfc, int lfr)
{
  if(lfc==1)
  {
    if(counter==1)
    {
      if(timer>set_value){
      lcd.print(timer); lcd.print(" Dash"); }
      else {
      lcd.print(timer); lcd.print(" Dot"); }      
      stop_bot();
      while(1);
    }    
    if((lfl==0)&&(lfr)==0)
      go_straight();
    else if((lfl==1)&&(lfr==0))
      go_left();
    else if((lfl==0)&&(lfr==1))
      go_right();
    else if((lfl==1)&&(lfr==1))
    {
      stop_bot();
      while(1);
    }
  }
  else
  {
    if((lfl==0)&&(lfr==1))
      go_right();
    else if((lfl==1)&&(lfr==0))
      go_left();
    else
    {
      go_straight();
      counter=1;
      timer++;
    }
  }
}
