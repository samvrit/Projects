void check_condition()
{
    if(straight==1) y++;
    if(left==1) { if(back==1) {back=0; x++;} else x--; }
    if(right==1) { if(back==1) {back=0; x--;} else x++; }
    if(reverse==1) y--;
    x=constrain(x,0,2); y=constrain(y,0,4);
    
    if((x==xf)&&(y==yf))                                              //If coordinates found, show colour.
    {
      if((x==2)&&(y==4))  stop_bot(); 
      else 
      {
        coordinate=1;
        go_straight();
        stop_bot();
        show_colour_code();
        next_coordinate();
        change_dir();
        coordinate=0;
      }
    }
    
    else
    {
      pass=1;
      change_dir();
      pass=0;
    }
}
