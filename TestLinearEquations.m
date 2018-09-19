% (a) Use a library routine for Gaussian
% elimination to solve the system Ax = b, where
%          2   4  -2
%     A =  4   9  -3
%         -2  -1   7
%           2
%     b =   8
%          10
% (b) Use the LU factorization of A already computed
% to solve the system Ay = c, where
%            4
%      c =   8
%           -6
% without refactoring the matrix.
% (c) If the matrix A changes so that a_{1,2} = 2, use the Sherman-Morrison
%     updating technique to compute the new solution x without refactoring
%     the matrix, using the original right-hand-side vector b
%
%     w = x + az
%
%       where
%
%     a = (v' * y)(1 - v'*z)

% (a)

A = [2 4 -2; 4 9 -3; -2 -1 7]
b = [2 8 10]'

[L, U] = lu(A);
z = L\b;
x = U\z

% (b)

c = [2 8 -6]'
z = L\c;
y = U\z

% (c)

u = [1 0 0]';
v = [0 2 0]';
z = A \ u;
a = (v' * x) / (1 - v' * z);

w = x + a*z