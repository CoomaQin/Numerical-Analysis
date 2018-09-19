function HW7_2_1_1()
%利用三次均匀B-Spline构造f(x)=sin(x)*exp(x)的等距结点的一型3次样条插值,x=[0,4];
m=10;
x=linspace(0,4,m);
y=sin(x).*exp(x);
figure(1);
hold on;
plot(x,y,'ko');
m0=exp(x(1))*(sin(x(1))+cos(x(1)));
m1=exp(x(end))*(sin(x(end))+cos(x(end)));
xmin=min(x);xmax=max(x);h=x(2)-x(1);
n=length(x)+2;
A=sparse(n,n);
A(1:n+1:end)=2/3;
A(2:n+1:(n-2)*n)=1/6;
A(2*n+2:n+1:end)=1/6;
%根据一型样条的边界条件修正系数矩阵的第一行和最后一行
A(1,1:3)=[-1/(2*h),0,1/(2*h)];
A(end,end-2:end)=[-1/(2*h),0,1/(2*h)];
%构造一型样条的右端项
b=[m0;y';m1];
%求解系数
alpha=A\b;
%绘图

%计算样条函数值
C=[ 1  4  1  0 ; -3  0  3  0 ;3  -6  3  0 ; -1  3  -3  1];
t=linspace(0,1,8*m)';
for i=1:n-3
    T=[t-t+1 t t.^2 t.^3]/6;
    B=[alpha(i);alpha(i+1);alpha(i+2);alpha(i+3)];
    yy=T*C*B;
    xx=x(i)+t*h;
    plot(xx,sin(xx).*exp(xx),'k-',xx,yy,'-.','LineWidth',2);
end
legend('Knots','e^xsin(x)','B-Spline');
title('Clamped Spline')