m=input('Input number of masses: ');
r=input('Radius of balancing mass: ');
disp('Mass | Radius | Angle');
a=zeros(m,1);
b=zeros(m,1);
c=zeros(m,1);
f=0;
g=0;
for i=1:m
    fprintf('Mass %d: ',i);
    a(i)=input('');
end
for i=1:m
    fprintf('Radius %d: ',i);
    b(i)=input('');
end
for i=1:m
    fprintf('Angle %d: ',i);
    c(i)=input('');
    d(i)=cosd(c(i));
    e(i)=sind(c(i));
end
for i=1:m
    f=f+(a(i)*b(i)*d(i));
    g=g+(a(i)*b(i)*e(i));
end
h=sqrt((f^2)+(g^2));
mass=h/r;
fprintf('Mass: %f | ',mass);
angle=atand(g/f);
fprintf('Angle: %f\n\n\n\n',angle);
c=c*(3.14/180);

desc={'Mass: ',mass,'Angle: ',angle};

subplot(1,2,2);
text(-100,100,desc)
axis equal
k=[0,0,0,0,0,0];
l=[0,0,0,0,0,0];
for i=2:m+1
    k(i)=k(i-1)+(a(i-1)*b(i-1)*d(i-1));
    l(i)=l(i-1)+(a(i-1)*b(i-1)*e(i-1));
end
hold on
for i=1:m
    arrow([k(i),l(i)],[k(i+1),l(i+1)]);
end
arrow([0,0],[k(m+1),l(m+1)],[],[],[],[5]);
hold off


subplot(1,2,1);
[x,y]=pol2cart(c,b);
compass(x,y);
hold on
c=(angle)*(3.14/180);
b=r;
[x,y]=pol2cart(c,b);
z=compass(x,y,'r');
set(z,'linewidth',3)
hold off


