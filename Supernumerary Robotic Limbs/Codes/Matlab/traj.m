l(1) = Link([0 0 0 0]);
l(2) = Link([0 0 0 pi/2]);
l(3) = Link([0 0 0 -pi/2]);
l(4) = Link([0 0.29 0 pi/2]);
l(5) = Link([0 0 0.3 -pi/2]);


r = SerialLink(l, 'name', 'SRL');

init_pos = [0 pi/2 pi/3 pi/4 pi/6];
r.plot(init_pos);
x0 = r.fkine(init_pos);

hold on;

for i = 1:3
    x1 = x0 + [0 0 0 -0.05 ; 0 0 0 0 ; 0 0 0 0 ; 0 0 0 1];
    q = r.ikine(x1,init_pos,[1,1,1,0,0,0]);
    r.plot(q1);
    x0=x1;
    init_pos=q;
end
hold off;