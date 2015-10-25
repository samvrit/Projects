if((exist('s','var'))==0)
    s=serial('COM3');
    s.BaudRate=115200;
end

if(strcmp(s.Status,'closed')>0)
    fopen(s);
end

pause(5);

while s.BytesAvailable > 0 
    junk=fscanf(s);
end

fprintf(s,'m');

for i=1:4
    junk=fscanf(s);
end

for i=1:4
    x = fscanf(s);  
    disp(x);
    split = strsplit(x,'\t');
    disp(split);
    yaw = str2double(split(1,2));
    pitch = str2double(split(1,3));
    roll = str2double(split(1,4));
    disp(yaw);
    disp(pitch);
    disp(roll);
end
fclose(s);
clear all;