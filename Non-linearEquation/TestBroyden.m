%solve non-linear equations by Newton method and Broyden method
%% Newton
N=20;
x=zeros(2,N);
x(:,1)=[-0.5;1.4];
syms x1 x2;
f1=(x1+3)*(x2^2-7)+18;
f2=sin(x2*exp(x1)-1);
J=jacobian([f1;f2],[x1 x2]);
f=[f1;f2];
for k=1:N
    A=double(subs(J,{x1,x2},{x(1,k),x(2,k)}));   
    b=double(subs(f,{x1,x2},{x(1,k),x(2,k)}));
    s=GaussianElim(A,-b,0);
    for j=1:2
        x(j,k+1)=x(j,k)+s(j);
    end
    if norm(x(:,k+1)-x(:,k),2)==0
        break;
    end
end
%% Broyden
B=eye(2);
z=zeros(2,N);
z(:,1)=[-0.5;1.4];
for k=1:N
    b=double(subs(f,{x1,x2},{z(1,k),z(2,k)}));
    s=GaussianElim(B,-b,0);
    for j=1:2
        z(j,k+1)=z(j,k)+s(j);
    end
    y=double(subs(f,{x1,x2},{z(1,k+1),z(2,k+1)})-subs(f,{x1,x2},{z(1,k),z(2,k)}));
    B=B+((y-B*s)*s')/(s'*s);
    if norm(z(:,k+1)-z(:,k),2)==0
        break;
    end
end
x_ect=zeros(2,N);
x_ect(2,:)=1;
err_N=abs(x_ect-x);
err_B=abs(x_ect-z);

    



