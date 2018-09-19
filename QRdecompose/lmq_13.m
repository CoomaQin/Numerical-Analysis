function s=lmq_13(epsilon)
B=epsilon.*eye(3);
A=[1,1,1;B];
b=[1;0;0;0];
Q1=LLOrth(A);
Q3=householder(A);
[Q4,~]=qrgv(A);
[Q5,~]=gram_schmidt(A);
Q6=gram_schmidt2(A);
[Q7,~]=gram_schmidt(Q1);
[Q8,~,~]=svd(A);

A1=Q1'*A;
A3=Q3*A;
A4=Q4*A;
A5=Q5'*A;
A6=Q6'*A;
A7=Q7'*A;
A8=Q8*A;

b1=Q1'*b;
b3=Q3*b;
b4=Q4*b;
b5=Q5'*b;
b6=Q6'*b;
b7=Q7'*b;
b8=Q8*b;

x1=A1\b1;
x2=A\b;
x3=A3\b3;
x4=A4\b4;
x5=A5\b5;
x6=A6\b6;
x7=A7\b7;
x8=A8\b8;

s=[x1,x2,x3,x4,x5,x6,x7,x8];
end