function s=Newton(n,x,b,t1)
%data:[x1,b1],[x2,b2],...
N=n+1;
A=zeros(N,N);
A(1:N,1)=1;
syms t;
f=1;
for i=2:N
    g=1;
    for k=1:i-1
        g=g*(t-x(k));
    end
    A(i:N,i)=subs(g,x(i:N));
    f=[f,g];
end
A
y=A\b';
s=0;
for k=1:N
    s=s+f(k)*y(k);
end
I=Horner(n,y,t1)
end
