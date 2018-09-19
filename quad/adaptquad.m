function [m,s]=adaptquad(f,a,b)
%b>=a
n=100;
h=(b-a)./n;
[I2,I1,~,~]=numint(f,a,b,h);
m=a+(b-a)/2;
if (m<=a|m>=b)
    warning('the interval excludes epsilon_machine') 
    s=I2;
else
    if abs(I2-I1)<=1e-10
    s=I2;
    else
    [m1,s1]=adaptquad(f,a,m);
    [m2,s2]=adaptquad(f,m,b);
    s=s1+s2;
    m=[m,m1,m2];
    end
end
end