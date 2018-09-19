function draw_bspline2()
figure(1);
hold on;
pos=15;
title('B-spline basis functions of degree 2');

xx=linspace(-3/2,-1/2,100);
yy=1/2*(xx+3/2).^2;
plot(xx-1,yy,'-.','LineWidth',2);
plot(xx,yy,'-.','LineWidth',2);
plot(xx+1,yy,'-','LineWidth',2);
text(xx(pos)+1,yy(pos),'B_{2}^{(1)}(x)');

xx=linspace(-1/2,1/2,100);
yy=3/4-xx.^2;
plot(xx-1,yy,'-.','LineWidth',2);
plot(xx,yy,'LineWidth',2);
text(xx(pos),yy(pos),'B_{2}^{(2)}(x)');
plot(xx+1,yy,'-.','LineWidth',2);


xx=linspace(1/2,3/2,100);
yy=1/2*(-xx+3/2).^2;
plot(xx-1,yy,'LineWidth',2);
text(xx(pos)-1,yy(pos),'B_{2}^{(3)}(x)');
plot(xx,yy,'-.','LineWidth',2);
plot(xx+1,yy,'-.','LineWidth',2);
