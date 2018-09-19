%% test params
a=1;
b=1;
c=1;
N=9;
x=zeros(3,N);
x(:,1)=[1+1i;1-1i;1];
syms x1 x2 x3;
f1=-(x1+x2+x3)-a;
f2=x1*x2+x2*x3+x1*x3-b;
f3=-x1*x2*x3-c;
J=jacobian([f1;f2;f3],[x1 x2 x3]);
%% code
for k=1:N
    A=double(subs(J,{x1,x2,x3},{x(1,k),x(2,k),x(3,k)}));
    f=[f1;f2;f3];
    b=double(subs(f,{x1,x2,x3},{x(1,k),x(2,k),x(3,k)}));
    s=GaussianElim(A,-b,0);
    for j=1:3
        x(j,k+1)=x(j,k)+s(j);
    end
end
S=solve('x+y+z=-1,x*y+x*z+y*z=1,x*y*z=-1','x,y,z');