function HW7_2_1_2()
%利用三次均匀B-Spline构造f(x)=sin(x)*exp(x)的等距结点的一型2次样条插值,x=[0,4];
m=15;
x=linspace(0,4,m);
y=sin(x).*exp(x);
figure(1);
hold on;
plot(x,y,'ko');
m0=exp(x(1))*(sin(x(1))+cos(x(1)));
m1=exp(x(end))*(sin(x(end))+cos(x(end)));
xmin=min(x);xmax=max(x);h=x(2)-x(1);
n=length(x)+1;
A=sparse(n,n);
A(1:n+1:end)=1/2;
A(2:n+1:end)=1/2;
%根据一型样条的边界条件修正系数矩阵的第一行和最后一行
A(1,1:2)=[-1/h,1/h];
A(end,end-1:end)=[-1/h,1/h];
%构造一型样条的右端项
b=[m0;y'];
%求解系数
alpha=A\b;
%绘图

%计算样条函数值
C=[ 1  1   0 ; -2  2  0 ;1  -2  1];
t=linspace(0,1,8*m)';
for i=1:n-2
    T=[t-t+1 t t.^2]/2;
    B=[alpha(i);alpha(i+1);alpha(i+2)];
    yy=T*C*B;
    xx=x(i)+t*h;
    plot(xx,sin(xx).*exp(xx),'k-',xx,yy,'-.','LineWidth',2);
end
legend('Knots','e^xsin(x)','B-Spline');
title('Clamped Spline')