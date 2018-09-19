function [xi,yi]=par_spline(x,y)
t(1)=0;
for i=1:length(x)-1
    t(i+1)=t(i)+sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2);
end
z=[t(1):(t(length(t))-t(1))/100:t(length(t))];
xi=spline(t,x,z);
yi=spline(t,y,z);