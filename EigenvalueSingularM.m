% A singular matrix must have a zero
% eigenvalue, but must a nearly singular matrix
% have a \small" eigenvalue? Consider a matrix
% of the form
%     1   1   1   1   1
%     0   1   1   1   1
% A = 0   0   1   1   1
%     0   0   0   1   1
%     0   0   0   0   1
% whose eigenvalues are obviously all ones. Use
% a library routine to compute the singular values
% of such a matrix for various orders. How
% does the ratio max=min behave as the order
% of the matrix grows? What conclusions can
% you draw?

e1=zeros(1,20);
e2=zeros(1,20);
for n=1:20
    A=hilb(n);
    e1(1,n)=max(eig(A));
    e2(1,n)=min(eig(A));
end
xx=1:20;
plot(xx,e1,'-b',xx,e2,'--r')
