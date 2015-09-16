t=zeros(1,500);
p=zeros(1,500);
for i=1:500
    t(1,i)=i;
    p(1,i)=i/2;
    disp(t(i));
    disp(p(i));
end
array = [t;p];
save('test.mat','array');