%calculate time consumes, errors and residuals of three Gauss elimination
%% test params
E=zeros(10,3);
R=zeros(10,3);
T=zeros(10,3);
xx=1:10;
%% code
for i=1:10
        A1=100*rand(4,4);
        x1=rand(4,1);
        b1=A1*x1;
        t1=clock;
        x_n=GaussianElim(A1,b1,0);
        t2=clock;
        x_p=GaussianElim(A1,b1,1);
        t3=clock;
        x_c=GaussianElim(A1,b1,2);
        t4=clock;
        Tnone=etime(t2,t1);
        Tpartial=etime(t3,t2);
        Tcomplete=etime(t4,t3);
        err_n=range(x_n-x1);
        err_p=range(x_p-x1);
        err_c=range(x_c-x1);
        r_n=range(b1-A1*x_n);
        r_p=range(b1-A1*x_p);
        r_c=range(b1-A1*x_c);
        err=[err_n err_p err_c];
        time=[Tnone Tpartial Tcomplete];
        residual=[r_n r_p r_c];
        E(i,:)=err;
        R(i,:)=residual;
        T(i,:)=time;
end
plot(xx,E(:,1))
hold on 
plot(xx,E(:,2))
hold on 
plot(xx,E(:,3))
figure;
plot(xx,R(:,1))
hold on 
plot(xx,R(:,2))
hold on 
plot(xx,R(:,3))
figure;
plot(xx,T(:,1))
hold on 
plot(xx,T(:,2))
hold on 
plot(xx,T(:,3))