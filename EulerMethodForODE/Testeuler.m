% slove differential equations by Eular method
%% test params
f1=@(x,y)x+y;
g1=@(x,y)-x+y;
f2=@(x,y)-x-y;
g2=@(x,y)x-y;
f3=@(x,y)-y;
g3=@(x,y)x;
f4=@(x,y)x+3.*y;
g4=@(x,y)2.*x+2.*y;
ft1=@(t)exp(t).*cos(t);
gt1=@(t)exp(t).*sin(t);
ft2=@(t)exp(-t).*cos(t);
gt2=@(t)-exp(-t).*sin(t);
ft3=@(t)cos(t);
gt3=@(t)-sin(t);
ft4=@(t)3.*exp(-t)+2.*exp(4*t);
gt4=@(t)-2.*exp(-t)+2.*exp(4*t);
%% code
%h=0.1
[t1,y1]=euler2([0 1],[0 1],10,f1,g1,ft1,gt1);
[t2,y2]=euler2([0 1],[0 1],10,f2,g2,ft2,gt2);
[t3,y3]=euler2([0 1],[0 1],10,f3,g3,ft3,gt3);
[t4,y4]=euler2([0 1],[0 5],10,f4,g4,ft4,gt4);
e1=[abs(y1(11,3)-y1(11,1)),abs(y1(11,4)-y1(11,2)),abs(y2(11,3)-y2(11,1)),abs(y2(11,4)-y2(11,2)),abs(y3(11,3)-y3(11,1)),abs(y3(11,4)-y3(11,2)),abs(y4(11,3)-y4(11,1)),abs(y4(11,4)-y4(11,2))];
subplot(2,2,1)
plot(t1,y1(:,1),'-*',t1,y1(:,2),'-o',t1,y1(:,3),t1,y1(:,4));
subplot(2,2,2)
plot(t2,y2(:,1),'-*',t2,y2(:,2),'-o',t2,y2(:,3),t2,y2(:,4));
subplot(2,2,3)
plot(t3,y3(:,1),'-*',t3,y3(:,2),'-o',t3,y3(:,3),t3,y3(:,4));
subplot(2,2,4)
plot(t4,y4(:,1),'-*',t4,y4(:,2),'-o',t4,y4(:,3),t4,y4(:,4));
%h=0.01
[t1,y1]=euler2([0 1],[0 1],100,f1,g1,ft1,gt1);
[t2,y2]=euler2([0 1],[0 1],100,f2,g2,ft2,gt2);
[t3,y3]=euler2([0 1],[0 1],100,f3,g3,ft3,gt3);
[t4,y4]=euler2([0 1],[0 5],100,f4,g4,ft4,gt4);
e2=[abs(y1(101,3)-y1(101,1)),abs(y1(101,4)-y1(101,2)),abs(y2(101,3)-y2(101,1)),abs(y2(101,4)-y2(101,2)),abs(y3(101,3)-y3(101,1)),abs(y3(101,4)-y3(101,2)),abs(y4(101,3)-y4(101,1)),abs(y4(101,4)-y4(101,2))];
figure;
subplot(2,2,1)
plot(t1,y1(:,1),'-*',t1,y1(:,2),'-o',t1,y1(:,3),t1,y1(:,4));
subplot(2,2,2)
plot(t2,y2(:,1),'-*',t2,y2(:,2),'-o',t2,y2(:,3),t2,y2(:,4));
subplot(2,2,3)
plot(t3,y3(:,1),'-*',t3,y3(:,2),'-o',t3,y3(:,3),t3,y3(:,4));
subplot(2,2,4)
plot(t4,y4(:,1),'-*',t4,y4(:,2),'-o',t4,y4(:,3),t4,y4(:,4));
figure;
tt=1:6;
plot(tt,e1(1:6),'o',tt,e2(1:6),'*');