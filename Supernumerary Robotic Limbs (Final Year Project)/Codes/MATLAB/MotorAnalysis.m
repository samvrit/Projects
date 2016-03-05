s = serial('COM4');
s.Terminator = 'CR';
fopen(s);

a = 1800;
string = int2str(a);
string = strcat('G',string);

while s.BytesAvailable > 2
    junk = fscanf(s);
    disp(junk);
end

fprintf(s,'P0');
fprintf(s,'M255');
fprintf(s,string);

t1 = clock();

x = 0;
y = 0;
t = 0;
count = 0;

str='';

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
    y(end+1) = 0.2*count;
    
    t2 = clock();
    t(end+1) = etime(t2,t1);
end

dy = diff(y);
dt = diff(t);
ddy = diff(dy);
ddt = diff(dt);

vel = dy/dt;
accel = ddy/ddt;

subplot(1,3,1);
plot(t,y);
title('Position');

subplot(1,3,2);
plot(t(1:end-1),vel);
title('Velocity');

subplot(1,3,3);
plot(t(1:end-2),accel);
title('Acceleration');

pause(1);

fclose(s);
clear all;

