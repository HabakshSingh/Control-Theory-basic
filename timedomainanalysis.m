clc
%let there is a unit step refereance input
m=2;c=4;k=50;
num=[k/m];den=[1 c/m k/m];
syms s t
nu=poly2sym(num,s);
de=poly2sym(den,s);
Gtf=tf(num,den);
G=nu/de;R=1/s;
Y=G*R;
y=ilaplace(Y,s,t);
yss=limit(y,t,inf);
ess=1-yss;
DCgain=yss/1;

Dr=c/(2*sqrt(k*m));
Wn=sqrt(k/m);Wd=Wn*sqrt(1-Dr^2);
%compute performance matrix based on thr second order system approach
%peak time Tp
Tp=pi/Wd;
a=sprintf('peak time Tp= %f sec',Tp);
disp(a);
%maximum overshoot MO
MO=double(subs(y,t,Tp)-1);
fprintf('maximum overshoot MO= %f \n',MO);
%Po  is percentage overshoot
Po=double((MO+1-yss)/yss)*100;
fprintf('Maximum percentage overshoot Po= %f percent \n',Po);
%settling time Ts
delta=0.02;
Ts=-log(delta/(Dr*Wn));
fprintf('settling time Ts= %f sec \n',Ts);
%rise time Tr
Tr=(pi-atan(sqrt(1-Dr^2)/Dr))/Wd;
fprintf('rise time Tr= %f',Tr);
step(Gtf);
