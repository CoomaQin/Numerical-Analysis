function [R,y]=givens(x,i,j)
% ����׼������Given�任����R��ʹ��Rx=y������y(j)=0��y(i)=sqrt(x(i)^2+x(j)^2)
%
% ����˵��
% x����Ҫ����Givens�任��������
% i����Ϊsqrt(x(i)^2+x(j)^2)��Ԫ���±�
% j����Ϊ0��Ԫ�ص��±�
% R��Givens�任����
% y��Givens�任���
%
% ʵ��˵��
% x=[1 3 5 9 6]'; % ��3��Ч��9��
% [R,y]=givens(x,4,2) % ע��3���±�Ϊ2��9���±�Ϊ4
% R*x-y % ��֤Rx=y
% R'*R % ��֤������
% norm(R) % ��֤��׼�ԣ����Ƿ���Ϊ1
%
% ����Givens�任˵��
% 1.Givens�����Ǳ�׼��������Ҳ��ƽ����ת��������ͨ��������ת��ԭ��Ԫ��j����ֵ��Ч��Ԫ��i��
% 2.Givens�任ÿ��ֻ�ܽ�һ��Ԫ�ر�Ϊ0����Householder�任��һ�ο��Խ������Ԫ�ر�Ϊ0
% 3.Givens�任�����ڽ�����A��Ϊ�Խ���
%
xi=x(i);
xj=x(j);
r=sqrt(xi^2+xj^2);
cost=xi/r;
sint=xj/r;
R=eye(length(x));
R(i,i)=cost;
R(i,j)=sint;
R(j,i)=-sint;
R(j,j)=cost;
y=x(:);
y([i,j])=[r,0];
end