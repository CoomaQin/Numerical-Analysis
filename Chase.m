%solve AX=b
%A must be a tridiagonal matrix
function X = Chase(A,f)
[N,~]=size(A);
a=zeros(N-1);
b=zeros(N);
c=zeros(N-1);
% Step 1
for i=1:N
    for j=1:N
        if i==j
            b(i)=A(i,i);
        elseif i==j-1
            c(i)=A(i,j);
        elseif i==j + 1
            a(i)=A(i,j);
        end
    end
end

Beta=zeros(N-1,1);
Beta(1)=c(1)/b(1);

for i=2:(N-1)
    Beta(i)=c(i)/(b(i)-a(i)*Beta(i-1));
end

% Step 2
Y=zeros(N,1);
Y(1)=f(1) / b(1);
for i=2:N
    Y(i)=(f(i)-a(i)*Y(i-1))/(b(i)-a(i)*Beta(i-1));
end

% Step 3
X = zeros(N,1);
X(N) = Y(N);
for i = (N-1):-1:1
    X(i) = Y(i) - Beta(i) * X(i + 1);
end
end