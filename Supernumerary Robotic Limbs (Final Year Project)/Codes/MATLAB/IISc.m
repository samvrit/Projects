clear all
load data.mat
%% Initial position to start position
xl = 0.15;
yl = 0;
zl = 0.4;
xl = [xl;0.1];
yl = [yl;-0.1];
zl = [zl;0.5];
rad = 0.05;
step = 0.02;
step_i = 0.025;

%% The first "I"
for y = -0.1:step_i:0.1
    z = 0.5;
    x = 0.2;
    xl = [xl;x];
    yl = [yl;y];
    zl = [zl;z];
end

%% Transition from first "I" to next "I"
xl = [xl;0.1];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.1];
yl = [yl;-0.1];
zl = [zl;0.47];

%% The second "I"
for y = -0.1:step_i:0.1
    z = 0.47;
    x = 0.2;
    xl = [xl;x];
    yl = [yl;y];
    zl = [zl;z];
end

%% Transition from second "I" to first half of "S"
xl = [xl;0.1];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.1];
yl = [yl;-0.1];
zl = [zl;0.39];

%% The letter "S"
% The first half of "S"
for y = -0.1:step:0
    if(((y+rad)^2)<=(rad^2))
        z = sqrt((rad^2)-((y+rad)^2))+0.39;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end
% The second half of "S"
for y = y+step:step:0.1
    if(((y-rad)^2)<=(rad^2))
        z = -sqrt((rad^2)-((y-rad)^2))+0.39;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end

%% Transition from "S" to "c"
xl = [xl;0.1];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.1];
yl = [yl;0];
zl = [zl;z];

%% "c"
for y = 0:step:0.1
    if(((y-rad)^2)<=(rad^2))
        z = sqrt((rad^2)-((y-rad)^2))+0.28;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end

%% Transition to initial position
xl = [xl;0.1];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.15];
yl = [yl;0];
zl = [zl;0.4];

%% The initial IK
T(:,:,1) = transl(xl(1),yl(1),zl(1));
q(:,:,1) = r.ikine(T(:,:,1),[0 0 0 0],[1 1 1 0 0 0]);
q1 = q(:,:,1);
q2 = q(:,:,1);
t = 0:0.1:1;

%% Compute IK
for i = 2:size(yl)
    T(:,:,i) = transl(xl(i),yl(i),zl(i));
    q(:,:,i) = r.ikine(T(:,:,i),[0 0 0 0],[1 1 1 0 0 0]);
    traj = jtraj(q(:,:,i-1),q(:,:,i),t);
    q2 = [q2;traj];
    q1 = [q1;q(:,:,i)];
end

%% Compute misc
q3 = radtodeg(q1);
q3 = q3 .* (5);
m1 = -q3(:,1);
m2 = q3(:,2);
m3 = -q3(:,3);
m4 = q3(:,4);

del = abs(diff(q3));
delay(1) = 0;
for i = 2:size(del)
    delay = [delay;max(del(i-1,:))];
end
delay = [delay;max(del(i,:))];
delay = delay .* 8.14863;

str1 = 'char* motor1[] = {';
str1 = strcat(str1,['"P',num2str(ceil(m1(1))),'",']);
for i = 2:size(m1)-1
    str = ['"G',num2str(ceil(m1(i))),'",'];
    str1 = strcat(str1,str);
end
str1 = strcat(str1,['"G',num2str(ceil(m1(1))),'"};']);
disp(str1)

str1 = 'char* motor2[] = {';
str1 = strcat(str1,['"P',num2str(ceil(m2(1))),'",']);
for i = 2:size(m2)-1
    str = ['"G',num2str(ceil(m2(i))),'",'];
    str1 = strcat(str1,str);
end
str1 = strcat(str1,['"G',num2str(ceil(m2(1))),'"};']);
disp(str1)

str1 = 'char* motor3[] = {';
str1 = strcat(str1,['"P',num2str(ceil(m3(1))),'",']);
for i = 2:size(m3)-1
    str = ['"G',num2str(ceil(m3(i))),'",'];
    str1 = strcat(str1,str);
end
str1 = strcat(str1,['"G',num2str(ceil(m3(1))),'"};']);
disp(str1)

str1 = 'char* motor4[] = {';
str1 = strcat(str1,['"P',num2str(ceil(m4(1))),'",']);
for i = 2:size(m4)-1
    str = ['"G',num2str(ceil(m4(i))),'",'];
    str1 = strcat(str1,str);
end
str1 = strcat(str1,['"G',num2str(ceil(m4(1))),'"};']);
disp(str1)

str1 = 'int delay_time[] = {';
for i = 1:size(delay)-1
    str = [num2str(ceil(delay(i))),','];
    str1 = strcat(str1,str);
end
str1 = strcat(str1,[num2str(ceil(delay(i+1))), '};']);
disp(str1)



%% Plot robot and joint angles

%plot(yl,zl,'o');
plot3(xl,yl,zl);
%r.teach(q1)
%r.teach(q2)

% figure;
% 
% subplot(4,1,1);
% plot(q1(:,1));
% title('1st Joint');
% xlabel('Time');
% ylabel('Joint Angle');
% 
% subplot(4,1,2);
% plot(q1(:,2));
% title('2nd Joint');
% xlabel('Time');
% ylabel('Joint Angle');
% 
% subplot(4,1,3);
% plot(q1(:,3));
% title('3rd Joint');
% xlabel('Time');
% ylabel('Joint Angle');
% 
% subplot(4,1,4);
% plot(q1(:,4));
% title('4th Joint');
% xlabel('Time');
% ylabel('Joint Angle');


