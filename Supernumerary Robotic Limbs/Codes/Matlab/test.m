s = serial('COM3');
s.Terminator = 'CR';
fopen(s);

while s.BytesAvailable > 2
    junk = fscanf(s);
    disp(junk);
end

fprintf(s,'P0');
fprintf(s,'M255');

count = 0;

a = 100;
count = run_motor(s,a,count);
pause(0.2);
a = 200;
count = run_motor(s,a,count);
pause(0.2);
a = 300;
count = run_motor(s,a,count);
pause(0.2);
a = 400;
count = run_motor(s,a,count);
pause(0.2);
a = 500;
count = run_motor(s,a,count);
pause(0.2);

fclose(s);
clear all;