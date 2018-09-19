% Vector version of Euler Method
% Input: interval inter, initial vector y0, number of steps n
% Output: time steps t, solution y
% Example usage: euler2([0 1],[0 1],10);
function [t,y]=euler2(inter,y0,n,f,g,ft,gt)
t(1)=inter(1); y(1,:)=y0;
h=(inter(2)-inter(1))/n;
for i=1:n
t(i+1)=t(i)+h;
y(i+1,:)=eulerstep(y(i,:),h);
end
y(:,3)=ft(t);
y(:,4)=gt(t);
function y=eulerstep(y,h)
%one step of the Euler Method
%Input: current time t, current vector y, step size h
%Output: the approximate solution vector at time t+h
y=y+h*ydot(y);
end
function z=ydot(y)
%right-hand side of differential equation
z(1)=f(y(1),y(2));
z(2)=g(y(1),y(2));
end
end