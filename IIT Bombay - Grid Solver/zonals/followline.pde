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
    else go_back(); 

}
