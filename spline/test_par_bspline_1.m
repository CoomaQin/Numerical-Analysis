function test_par_bspline_1
x=[-10:2:10];
y=floor(sin(x)*100);
par_bspline(x,y);
