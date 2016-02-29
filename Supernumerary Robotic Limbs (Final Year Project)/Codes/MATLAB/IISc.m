clear all
load data.mat
%% Initial position to start position
xl = 0.15;
yl = 0;
zl = 0.29;
xl = [xl;0.15];
yl = [yl;-.1];
zl = [zl;0.5];
rad = 0.05;
step = 0.01;
step_i = 0.05;

%% The first "I"
for y = -0.1:step_i:0.1
    z = 0.5;
    x = 0.2;
    xl = [xl;x];
    yl = [yl;y];
    zl = [zl;z];
end

%% Transition from first "I" to next "I"
xl = [xl;0.15];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.15];
yl = [yl;-0.1];
zl = [zl;0.4];

%% The second "I"
for y = -0.1:step_i:0.1
    z = 0.4;
    x = 0.2;
    xl = [xl;x];
    yl = [yl;y];
    zl = [zl;z];
end

%% Transition from second "I" to first half of "S"
xl = [xl;0.15];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.15];
yl = [yl;-0.1];
zl = [zl;0.29];

%% The letter "S"
% The first half of "S"
for y = -0.1:step:0
    if(((y+rad)^2)<=(rad^2))
        z = sqrt((rad^2)-((y+rad)^2))+0.29;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end
% The second half of "S"
for y = y+step:step:0.1
    if(((y-rad)^2)<=(rad^2))
        z = -sqrt((rad^2)-((y-rad)^2))+0.29;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end

%% Transition from "S" to "c"
xl = [xl;0.15];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.15];
yl = [yl;0];
zl = [zl;0.15];

%% "c"
for y = 0:step:0.1
    if(((y-rad)^2)<=(rad^2))
        z = sqrt((rad^2)-((y-rad)^2))+0.15;
        xl = [xl;0.2];
        yl = [yl;y];
        zl = [zl;z];
    end
end

%% Transition to initial position
xl = [xl;0.15];
yl = [yl;y];
zl = [zl;z];
xl = [xl;0.15];
yl = [yl;0];
zl = [zl;0.29];

%% The initial IK
T(:,:,1) = transl(xl(1),yl(1),zl(1));
q(:,:,1) = r.ikine(T(:,:,1),[0 0 0 0],[1 1 1 0 0 0]);
q1 = q(:,:,1);
t = 0:0.1:1;

%% Compute IK
for i = 2:size(yl)
    T(:,:,i) = transl(xl(i),yl(i),zl(i));
    q(:,:,i) = r.ikine(T(:,:,i),[0 0 0 0],[1 1 1 0 0 0]);
    traj = jtraj(q(:,:,i-1),q(:,:,i),t);
    %q1 = [q1;traj];
    q1 = [q1;q(:,:,i)];
end

%% Plot robot and joint angles

%plot(yl,zl);
%plot3(xl,yl,zl);
r.teach(q1)

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


