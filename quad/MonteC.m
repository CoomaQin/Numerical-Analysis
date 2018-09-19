function s=MonteC(f,a,b,n)
h=(b-a);
r=h*rand(1,n);
xx=a+r;
s=mean(f(xx))*h;
end
