%test if ritz values converge to eigenvalues in tri-diagonal matrixs
%% test params
% the order of the tri-diagonal matrix
n=20;
%% code
B=rand(n,n);
[q,~]=qr(B);
C=eye(n);
for i=1:n
    C(i,i)=i;
end
A=q*C*q';
s=Lanczos(A)
