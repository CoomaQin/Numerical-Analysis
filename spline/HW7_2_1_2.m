function HW7_2_1_2()
%�������ξ���B-Spline����f(x)=sin(x)*exp(x)�ĵȾ����һ��2��������ֵ,x=[0,4];
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
%����һ�������ı߽���������ϵ������ĵ�һ�к����һ��
A(1,1:2)=[-1/h,1/h];
A(end,end-1:end)=[-1/h,1/h];
%����һ���������Ҷ���
b=[m0;y'];
%���ϵ��
alpha=A\b;
%��ͼ

%������������ֵ
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