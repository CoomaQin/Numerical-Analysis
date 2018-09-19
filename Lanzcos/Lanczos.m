%calculate ritz values by Lanczons iteration

function ritz=Lanczos(A)
n=size(A,1);
ritz=zeros(n,30);
beta=zeros(n,1000);
alpha=zeros(n,1000);
q=zeros(n,1000);
x0=rand(n,1);
q(:,2)=x0./norm(x0,2);
for i=1:30
    u=A*q(:,i+1);
    alpha(i+1)=conj(q(:,i+1)')*u;
    u=u-beta(i)*q(:,i)-alpha(i+1)*q(:,i+1);
    beta(i+1)=norm(u,2);
    if i==1
        H=zeros(1);
        H(1,1)=alpha(2);
        ritz(1,1)=eig(H);
    else 
        H=zeros(i);
        for k=1:i
        H(k,k)=alpha(k+1);
        end
        for j=1:i-1
            H(j,j+1)=beta(j+1);
            H(j+1,j)=beta(j+1);
        end
        e=eig(H);
        for l=1:size(e)
            ritz(l,i)=e(l);
        end
    end
        
    if beta(i+1)==0
        break;
    end  
    q(:,i+2)=u/beta(i+1);
end
end
