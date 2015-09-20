void code(int time)
{
  if(time>set_value){
    a[i]=1; lcd.setCursor(0,0); lcd.print(i); lcd.println(" Dash"); }
  else {
    a[i]=0; lcd.setCursor(0,0); lcd.print(i); lcd.println(" Dot"); }
  if(i<5)
  i++;
  if(i==5)
    {
      i=0;
      code_compare();
    }
}

void show_code()
{
  Serial.print("Sum: "); Serial.print(sum);
  lcd.clear();
  lcd.print("SUM:");
  lcd.print(sum);
}

void code_compare()
{
       Serial.println("Code Compare");
       for(int j=0;j<9;j++)
       {
         Serial.print("J = "); Serial.println(j);
         for(i=0;i<5;i++)                
          {
            Serial.print("I = "); Serial.println(i);
            if(a[i]!=codes[j][i])
            {
              compare=0;
              break;
            }
            else compare=1;
            Serial.print("Compare: "); Serial.println(compare);
          }
         if(compare==1)
            { sum=sum+j; lcd.setCursor(0,1); lcd.print("SUM: "); lcd.print(sum); }
       }
}

void check_counter()
{
    if(counter==1)
        {
          counter=0;
          code(timer);
          timer=0;
        }   
}







