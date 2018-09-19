function [Q,R]=qrgv(A)
% base on Givens transformation, A=QR
% Q is a orthogonal matrix
%R is a upper triangular matrix

n=size(A,1);
R=A;
Q=eye(n);
for i=1:n-1
    for j=2:n-i+1
        x=R(i:n,i);
        rt=givens(x,1,j);
        r=blkdiag(eye(i-1),rt);
        Q=Q*r';
        R=r*R;
    end
end

end