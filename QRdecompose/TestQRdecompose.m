% calcuate time consumes of various QR decomposes in Hilbert matrix
%% test params 
n=10;
%% code
H=hilb(n);
t0=clock;
[Q1,~]=gram_schmidt(H);
t1=clock;
Q2=gram_schmidt2(H);
t2=clock;
[Q3,~]=gram_schmidt(Q1);
t3=clock;
Q4=householder(H);
t4=clock;
[~,~,Q5]=svd(H);
t5=clock;
Q6=LLOrth(H);
t6=clock;
t=[etime(t1,t0),etime(t2,t1),etime(t3,t2)+etime(t1,t0),etime(t4,t3),etime(t5,t4),etime(t6,t5)];
s=[pre(Q1),pre(Q2),pre(Q3),pre(Q4),pre(Q5),pre(Q6)];
%% function
function y=pre(A)
    y=-log(norm(eye(n)-A'*A,2));
end
