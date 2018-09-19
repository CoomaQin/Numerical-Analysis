%% tast params
f=@(x)x.^3./(exp(x)-1);
N1=1e2;
N2=1e3;
N3=1e4;
N4=1e5;
%% code
[q1,~]=quad(f,0,N1)
[Q1,~]=quadv(f,0,N1)
[q2,~]=quad(f,0,N2)
[Q2,~]=quadv(f,0,N2)
[q3,~]=quad(f,0,N3)
[Q3,~]=quadv(f,0,N3)
[q4,~]=quad(f,0,N4)
[Q4,~]=quadv(f,0,N4)
%I_c=CTR(N,0,N,f);
%I_a=adaptquad(f,0,N);
