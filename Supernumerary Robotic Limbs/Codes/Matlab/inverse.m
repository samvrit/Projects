function [th0,th1,th2,th3,th4] = inverse(x,y,z)
display(y);

z1 = sqrt((z*z)+(y*y));
k = sqrt((x*x)+(z1*z1));

phi1 = atan2(x,z1);
phi2 = acos(((0.29*0.29)+(k*k)-(0.3*0.3))/(2*0.29*k));
phi3 = acos(((0.29*0.29)-(k*k)+(0.3*0.3))/(2*0.29*0.3));

th0 = 0;

th1 = 0;

if(x>0)
    th2 = -(phi1 + phi2);
else
    th2 = phi2 - phi1;
end

a = 0.3*sin(th2);
if(x>0)
    l2 = a-x;
else
    l2 = a+x;
end
th3 = 2*asin(y/l2);

%th3 = -atan2(y,z);

if(x>=0)
    th4 = 1.5*pi - phi3;
else
    th4 = -0.5*pi + phi3;
end