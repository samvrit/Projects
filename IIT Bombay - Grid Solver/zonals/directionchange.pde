void change_dir()
{
      if(((xf-x)>0)&&((yf-y)>0))
      {
        if(straight==1) { if(coordinate==1) right1(); else sharp_right(); }
        else if(right==1) go_straight();
        else if(left==1) reverse1();
        else if(reverse==1) { if(coordinate==1) left1(); else sharp_left(); }
      }
      	
      else if(((xf-x)>0)&&((yf-y)==0))
      {
        if(straight==1) { if(coordinate==1) right1(); else sharp_right(); }
        else if(right==1) go_straight();
        else if(left==1) reverse1();
        else if(reverse==1) { if(coordinate==1) left1(); else sharp_left(); }
      }
      
      else if(((xf-x)==0)&&((yf-y)>0))
      {
        if(straight==1) go_straight();
        else if(right==1) { if(coordinate==1) left1(); else sharp_left(); }
        else if(left==1) { if(coordinate==1) right1(); else sharp_right(); }
        else if(reverse==1) reverse1(); 
      }
      
      else if(((xf-x)<0)&&((yf-y)==0))
      {
        if(straight==1) { if(coordinate==1) left1(); else sharp_left(); }
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) { if(coordinate==1) right1(); else sharp_right(); } 
      }
      
      else if(((xf-x)<0)&&((yf-y)>0))
      {
        if(straight==1) { if(coordinate==1) left1(); else sharp_left(); }
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) { if(coordinate==1) right1(); else sharp_right(); } 
      }
      
      else if(((xf-x)<0)&&((yf-y)<0))
      {
        if(straight==1) { if(coordinate==1) left1(); else sharp_left(); }
        else if(right==1) reverse1();
        else if(left==1) go_straight();
        else if(reverse==1) { if(coordinate==1) right1(); else sharp_right(); }   
      }
}
