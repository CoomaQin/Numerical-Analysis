function s=Newton2(x,b,t)
syms t;
[~,n]=size(x);
PI=t;
for i=1:n
    g=1;
    for k=1:i-1
        g=g*(t-x(k));
    end
    PI(i)=g;
end
p=sym('p',[1,n]);
p(1)=b(1);
for i=2:n
    p(i)=p(i-1)+PI(i)*(b(i)-subs(p(i-1),x(i)))/subs(PI(i),x(i));
end
s=p(n);
end
