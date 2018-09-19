% An experiment has produced the following
% data:
% t 0.0 0.5 1.0 6.0 7.0 9.0
% y 0.0 1.6 2.0 2.0 1.5 0.0
% We wish to interpolate the data with a smooth
% curve in the hope of obtaining reasonable values
% of y for values of t between the points at
% which measurements were taken.
% (a) Using any method you like, determine the
% polynomial of degree five that interpolattes the
% given data, and make a smooth plot of it over
% the range 0 <= t <= 9.
% (b) Similarly, determine a cubic spline that interpolates
% the given data, and make a smooth
% plot of it over the same range.
% (c) Which interpolant seems to give more reasonable
% values between the given data points?
% Can you explain why each curve behaves the
% way it does?
% (d) Might piecewise linear interpolation be a
% better choice for these particular data? Why?

x1=-1:0.2:1;
x2=-1:0.4:1;
f=@(x)1./(1+25.*x.^2);
y1=f(x1);
y2=f(x2);
dy=50./26.^2;
xx=-1:0.04:1;
Y1=CubicSpline(x1,y1,dy,-dy,xx);
Y2=CubicSpline(x2,y2,dy,-dy,xx);
Y3=f(xx);
plot(xx,Y1,'--',xx,Y2,'-*',xx,Y3,'-o');
grid on;
