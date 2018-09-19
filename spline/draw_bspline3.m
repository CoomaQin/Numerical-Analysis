function draw_bspline3()
figure(1);
hold on;
pos=15;
title('B-spline basis functions of degree 3');
xx=linspace(-2,-1,100);
yy=xx.^3/6+xx.^2+2*xx+4/3;
plot(xx-1,yy,'-.','LineWidth',2);
plot(xx,yy,'-.','LineWidth',2);
plot(xx+1,yy,'-.','LineWidth',2);
plot(xx+2,yy,'LineWidth',2);
text(xx(pos)+2,yy(pos),'B_{3}^{(1)}(x)');

xx=linspace(-1,0,100);
yy=-xx.^3/2-xx.^2+2/3;
plot(xx-1,yy,'-.','LineWidth',2);
plot(xx,yy,'-.','LineWidth',2);
plot(xx+1,yy,'LineWidth',2);
text(xx(pos)+1,yy(pos),'B_{3}^{(2)}(x)');
plot(xx+2,yy,'-.','LineWidth',2);

xx=linspace(0,1,100);
yy=xx.^3/2-xx.^2+2/3;
plot(xx-1,yy,'-.','LineWidth',2);
plot(xx,yy,'LineWidth',2);
text(xx(pos),yy(pos),'B_{3}^{(3)}(x)');
plot(xx+1,yy,'-.','LineWidth',2);
plot(xx+2,yy,'-.','LineWidth',2);

xx=linspace(1,2,100);
yy=-xx.^3/6+xx.^2-2*xx+4/3;
plot(xx-1,yy,'LineWidth',2);
text(xx(pos)-1,yy(pos),'B_{3}^{(4)}(x)');
plot(xx,yy,'-.','LineWidth',2);
plot(xx+1,yy,'-.','LineWidth',2);
plot(xx+2,yy,'-.','LineWidth',2);