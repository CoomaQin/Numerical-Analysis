function par_bspline(x,y)
if length(x)~=length(y)
    return
end
n=length(x);
t=[0:0.01:1]';
figure(1);
hold on;
plot(x,y,'*');
A=[1 -2 1;-2 2 0;1 1 0];
for i=1:n-2
    T=[t.^2 t (t-t)+1]/2;
    B=[x(i) y(i);x(i+1),y(i+1);x(i+2),y(i+2)];
    P=T*A*B;
    plot(P(:,1),P(:,2),'LineWidth',2);
end
