void check_condition()
{
    if(straight==1) y++;
    if(left==1) { if(back==1) {back=0; x++;} else x--; }
    if(right==1) { if(back==1) {back=0; x--;} else x++; }
    if(reverse==1) y--;
    x=constrain(x,0,2); y=constrain(y,0,4);
    Serial.println("Current Position:");
    Serial.print(" X = "); Serial.print(x); Serial.print(" Y = "); Serial.print(y);
    
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
        Serial.println("Show colour code");
        Serial.println("Next coordinates: Xf = "); Serial.print(xf); Serial.print(" Yf = "); Serial.print(y);
        Serial.println("Orientation: ");
        if(straight==1) Serial.print("Straight");
        if(right==1) Serial.print("Right");
        if(left==1) Serial.print("Left");
        if(reverse==1) Serial.print("Reverse");
        if(back==1) Serial.print("Back=1");
      }
    }
    
    else
    {
      pass=1;
      change_dir();
      pass=0;
      Serial.println("Orientation: ");
      if(straight==1) Serial.print("Straight");
      if(right==1) Serial.print("Right");
      if(left==1) Serial.print("Left");
      if(reverse==1) Serial.print("Reverse");
      if(back==1) Serial.print("Back=1");
    }
}
