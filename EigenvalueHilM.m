% Compute the eigenvalues of the Hilbert
% matrix of order n (see Computer Problem 2.6)
% for several values of n, say, up to n = 20. Can
% you characterize the range of magnitudes of
% the eigenvalues as a function of n?

u=1000*rand(1,100);
%u=[1 -13 35 -40 24];
t0=clock;
n=30;
for i=1:n
A=compan(u);
e1=eig(A);
end
t1=clock;
for i=1:n
e2=roots(u);
end 
t2=clock;
T1=etime(t1,t0)./n;
T2=etime(t2,t1)./n;
