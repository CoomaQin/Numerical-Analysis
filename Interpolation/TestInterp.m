%% test params
f1=@(x)x.^3-2.*x-5;
f2=@(x)exp(-x)-x;
f3=@(x)x.*sin(x)-1;
f4=@(x)x^3-3.*x^2+3.*x-1;
%% code
[x1_1,y1_1,h1_1]=InvSquInterp(f1,1,2,3,0.00001);
[x1_2,y1_2,h1_2]=RaInterp(f1,1,2,3,0.00001);
[x2_1,y2_1,h2_1]=InvSquInterp(f2,1,2,3,0.00001);
[x2_2,y2_2,h2_2]=RaInterp(f2,1,2,3,0.00001);
[x3_1,y3_1,h3_1]=InvSquInterp(f3,1,2,3,0.00001);
[x3_2,y3_2,h3_2]=RaInterp(f3,1,2,3,0.00001);
[x4_1,y4_1,h4_1]=InvSquInterp(f4,1,2,3,0.00001);
[x4_2,y4_2,h4_2]=RaInterp(f4,1,2,3,0.00001);

