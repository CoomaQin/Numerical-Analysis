%the relations between stpes and errors

%% test params
h=0.01:0.01:0.1;
[~,n]=size(h);
e_m=zeros(1,n);
e_t=zeros(1,n);
e_s=zeros(1,n);
e_l=zeros(1,n);
MonteNumber=1000000;
%% code
for i=1:n
    f=@(x)4./(1+x.^2);
    [I_m,I_t,I_s,I_l]=numint(f,0,1,h(i));
    e_m(i)=pi-I_m;
    e_t(i)=pi-I_t;
    e_s(i)=pi-I_s;
    e_l(i)=pi-I_l;
end
plot(h,e_m,'o',h,e_t,'*',h,e_s,'+');
plot(h,e_l,'o')
I_mc=MonteC(f,0,1,MonteNumber);
[m,I_e]=adaptquad(f,0,1);
y=f(m);
plot(m,y,'+');