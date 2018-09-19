function test_par_bspline_2
close all;
x=[0 1/3 2/3 1 1 1 2 2/3 1/3 0 0 0 0  1/3];
y=[0 0 0 0 1/3 2/3 2 1 1 1 2/3 1/3 0  0];
par_bspline(x,y);