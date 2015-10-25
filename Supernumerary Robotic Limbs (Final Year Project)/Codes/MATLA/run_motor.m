
function count = run_motor(s,a,count)
string = int2str(a);
string = strcat('G',string);
fprintf(s,string);

while count < a
    
    
    while s.BytesAvailable > 2
        junk = fscanf(s);
        disp(junk);
    end
    
    fprintf(s,'P');
    
    str = fscanf(s);
    disp(str);
    
    str1 = strsplit(str,'P');
    val = str1(1,2);
    count = str2double(val);
    
end
end

