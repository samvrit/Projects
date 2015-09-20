void follow_line(int lfl, int lfc, int lfr)
{
  if(lfc==1)
  {
    check_counter();
    if((lfl==0)&&(lfr==0))
      go_straight();
    else if((lfl==1)&&(lfr==0))
      go_left();
    else if((lfl==0)&&(lfr==1))
      go_right();
//    else if((lfl==1)&&(lfr==1))
//      stop_bot();
  }
  else
  {
    if((lfl==0)&&(lfr==1))
    {
       check_counter();    
       go_right(); 
     }
    else if((lfl==1)&&(lfr==0))
    {
      check_counter();
      go_left(); 
    }
    else
    {
      go_straight();
      counter=1;
      timer++;
    }
  }
}
