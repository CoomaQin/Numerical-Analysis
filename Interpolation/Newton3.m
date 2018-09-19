function p=Newton3(x,b)
%recurrence
[~,n]=size(x);
if n==1
    p=sym(p,[1,1]);
    p=b(1);
else
    syms t;
    pi=1;
    g=1;
    for k=1:n-1
        g=g*(t-x(k));
    end
    p=Newton3(x(1:n-1),b(1:n-1))+(b-subs(p,x)/subs(PI,x))*pi;
end
