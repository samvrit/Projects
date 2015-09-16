[a1,b1,c1,d1,e1] = inverse(0.3,0,0.29);
[a2,b2,c2,d2,e2] = inverse(0.5,0,0.29);

q0 = [a1 b1 c1 d1 e1];
q1 = [a2,b2,c2,d2,e2];

t = 0:0.1:10;

tr1 = jtraj(q0,q1,t);

r.plot(tr1);
r.teach(q1);

figure;

subplot(4,1,1);
plot(tr1(:,2));
title('1st Joint');
xlabel('Time');
ylabel('Joint Angle');

subplot(4,1,2);
plot(tr1(:,3));
title('2nd Joint');
xlabel('Time');
ylabel('Joint Angle');

subplot(4,1,3);
plot(tr1(:,4));
title('3rd Joint');
xlabel('Time');
ylabel('Joint Angle');

subplot(4,1,4);
plot(tr1(:,5));
title('4th Joint');
xlabel('Time');
ylabel('Joint Angle');
