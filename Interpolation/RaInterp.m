
function [x,s,h]=RaInterp(f,a,b,c,err)
    x=zeros(1,50);
    s=zeros(1,50);
    h=zeros(1,50);
    i=1;
    while i
        A=[1,a.*f(a),-f(a);1,b.*f(b),-f(b);1,c.*f(c),-f(c)];
        U=A\[a;b;c];
        h(i)=(a-c).*(b-c).*(f(a)-f(b)).*f(c)./((a-c).*(f(c)-f(b)).*f(c)-(b-c).*(f(c)-f(a)).*f(b));
        a=b;
        b=c;        
        c=U(1);
        x(i)=c;
        s(i)=f(c);
        if abs(h(i))<err
            break
        elseif i==50
            break;
        end
        i=i+1;
    end
    x=x(x~=0);
    s=s(s~=0);
    h=h(h~=0);
end
