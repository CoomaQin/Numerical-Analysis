function test_par_spline
x=[1 2 3 4 5 7 8 6];
y=[3 2 6 7 10 6 -3 -1];
[xi,yi]=par_spline(x,y);
plot(x,y,'*',xi,yi,'LineWidth',2);
