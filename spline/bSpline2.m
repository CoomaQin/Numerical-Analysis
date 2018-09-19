function test()
global xflag Cnt xy h2 h3 h4 htext
h=figure(1);
title('2´ÎB-splineÄâºÏ');
hold on;
axis([0,10,0,10]);
xy=[];
set(gca,'XLimMode','manual','YLimMode','manual');
xflag=0;
Cnt=0;
set(h,'WindowButtonMotionFcn',@myCallback1);
set(h,'WindowButtonDownFcn',@myCallback2);
set(h,'WindowButtonUpFcn',@myCallback3);
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    h1=plot(xi,yi,'ro');
    Cnt=Cnt+1;
    xy(:,Cnt) =[xi;yi];
    str=strcat('(',num2str(xi,2),',',num2str(yi,2),')');
    htext(Cnt)=text(xi+0.2,yi,str);
    set(h1,'UserData',Cnt);
end
h3=plot(xy(1,:),xy(2,:),'k');
[x0,y0,knots]=par_bspline2(xy(1,:),xy(2,:));
h2=plot(x0,y0,'r-','LineWidth',2);
h4=plot(knots(:,1),knots(:,2),'*');

function myCallback2(obj,eventdata)
global xflag h2 h3 h4
type=lower(get(gco,'Type'));
if strcmp(type,'line') & gco~=h2 & gco~=h3 & gco~=h4
    xflag=1;
end

function myCallback3(obj,eventdata)
global xflag
xflag=0;

function myCallback1(obj,eventdata)
global xflag Cnt xy h2 h3 h4 htext
type=lower(get(gco,'Type'));
if strcmp(type,'line') & xflag==1 & gco~=h2 & gco~=h3 & gco~=h4
    pos=get(get(gco,'parent'),'CurrentPoint');
    n=get(gco,'UserData');
    xy(:,n)=[pos(2,1);pos(2,2)];
    str=strcat('(',num2str(pos(2,1),2),',',num2str(pos(2,2),2),')');
    set(htext(n),'Position',[pos(2,1)+0.2,pos(2,2),0],'String',str);
    set(gco,'XData',pos(2,1),'YData',pos(2,2));
    set(h3,'XData',xy(1,:),'YData',xy(2,:));
    [x0,y0,knots]=par_bspline2(xy(1,:),xy(2,:));
    set(h2,'XData',x0,'YData',y0,'LineWidth',2);
    set(h4,'XData',knots(:,1),'YData',knots(:,2));
end

function [x0,y0,knots]=par_bspline2(x,y)
if length(x)~=length(y)
    return
end
% x=[x(1),x,x(end)];
% y=[y(1),y,y(end)];
n=length(x);
if sqrt((x(n)-x(1))^2+(y(n)-y(1))^2)<0.0001
    x(n)=x(1);
    y(n)=y(1);
    x(n+1)=x(2);
    y(n+1)=y(2);
end
n=length(x);
t=[0:0.01:1]';
hold on;
A=[1 -2 1;-2 2 0;1 1 0];
x0=[];
y0=[];
knots=[];
for i=1:n-2
    T=[t.^2 t (t-t)+1]/2;
    B=[x(i) y(i);x(i+1),y(i+1);x(i+2),y(i+2)];
    P=T*A*B;
    x0=[x0;P(:,1)];
    y0=[y0;P(:,2)];
    if i==1
        knots=[knots;P(1,:)];
    end
    knots=[knots;P(end,:)]
end
