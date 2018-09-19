%midpoint, trapezoid, and Simpson composite quadrature rules
%interval:[a,b]
%step:h
%integrand function:f

function [Mid,Tpz,Sim,L]=numint(f,a,b,h)
xx=a:h:b;
[~,n]=size(xx);
Mid=0;Tpz=0;Sim=0;
for i=1:n-1
    Mid=Mid+h*f(0.5*(xx(i)+xx(i+1)));
    Tpz=Tpz+0.5*h*(f(xx(i))+f(xx(i+1)));
    Sim=Sim+h*(f(xx(i))+f(xx(i+1))+4*f(0.5*(xx(i)+xx(i+1))))/6;
end
L=CTR(n-1,0,1,f);
end


