function s=CTR(n,a,b,f)
%复合梯形公式
%--f为句柄函数
%如：f=@(x,y) x^2+y^2;k1=feval(f,1,t);k1 =t^2 + 1
h=(b-a)./n;
s=0;
for i=1:n-1
    x=a+h.*i;
    s=s+feval(f,x);
end
s=h.*(feval(f,a)+feval(f,b))./2+h.*s;
end