if((exist('s','var'))==0)
    s=serial('COM3');
    s.BaudRate=38400;
end

if(strcmp(s.Status,'closed')>0)
    fopen(s);
end

pause(5);


for i=1:2
    junk=fscanf(s);
end

yaw = zeros(100,1);
pitch = zeros(100,1);
roll = zeros(100,1);
t = zeros(100,1);

for i=1:10
    junk=fscanf(s);
end

t1 = clock();

for i=1:100
    x = fscanf(s);
    t2 = clock();
    t(i,1) = etime(t2,t1);
    disp(x);
    split = strsplit(x,'\t');
    disp(split);
    yaw(i,1) = str2double(split(1,2));
    pitch(i,1) = str2double(split(1,3));
    roll(i,1) = str2double(split(1,4));
    disp(yaw(i,1));
    disp(pitch(i,1));
    disp(roll(i,1));
end
fclose(s);
clear s;

time = 0:0.1:t(100,1);

yaw_int = interp1(transpose(t),transpose(yaw),time);
pitch_int = interp1(transpose(t),transpose(pitch),time);
roll_int = interp1(transpose(t),transpose(roll),time);

yaw_int(isnan(yaw_int))=0;
pitch_int(isnan(pitch_int))=0;
roll_int(isnan(roll_int))=0;

yaw_1 = [transpose(time) transpose(yaw_int)];
pitch_1 = [transpose(time) transpose(pitch_int)];
roll_1 = [transpose(time) transpose(roll_int)];

