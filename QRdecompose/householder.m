function H = householder(A)
[m,n]=size(A);
for k=1:n
    e=eye(m);
    xi(k)=-sign(A(k,k))*sqrt(sum(A(k:m,k).*A(k:m,k)));
    v(:,k)=[zeros(1,k-1),A(k:m,k)']'-xi(k).*e(:,k);
    beta(k)=v(:,k)'*v(:,k);
    if(beta(k)==0)
        continue
    end
        for j=k:n
            gamma(j)=v(:,k)'*A(:,j);
            A(:,j)=A(:,j)-(2*gamma(j)/beta(k)).*v(:,k);
        end
end
H=eye(m);
for i=1:n
    H=(eye(m)-2*v(:,i)*v(:,i)'/beta(i))*H;
end
end