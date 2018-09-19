function [x,s,h]=InvSquInterp(f,a,b,c,err)
x=zeros(1,50);
s=zeros(1,50);
h=zeros(1,50);
i=1;
while i
    u=f(b)./f(c);
    v=f(b)./f(a);
    w=f(a)./f(c);
    p=v.*(w.*(u-w).*(c-b)-(1-u).*(b-a));
    q=(w-1).*(u-1).*(v-1);
    c=a;
    a=b;
    b=b+p./q;
    x(i)=b;
    s(i)=f(b);
    h(i)=p./q;
    if (abs(h(i))<err)
        break;
    elseif (i==50)
        break;
    end
    i=i+1;
end
x=x(x~=0);
s=s(s~=0);
h=h(h~=0);  
end