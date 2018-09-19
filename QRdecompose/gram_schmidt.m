
function [Q,R] = gram_schmidt(A)
%classical 

[n,m] = size(A);
Q = zeros(n,m);
R = zeros(m,m);

Q(:,1) = A(:,1)/norm(A(:,1));
R(1,1) = norm(A(:,1));

for j = 2:m
    z = A(:,j);
    for i = 1:j-1
        R(i,j) = A(:,i)'*A(:,j);
        z = z - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(z);
    Q(:,j) = z/R(j,j);
end

end