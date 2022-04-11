A=[ 0 1;20.6 0];
B=[0;1];C=[1 0];
M=[B A*B]; %controlability matrix
determinent=det(M);
CE=charpoly(A);% characteristic equation 
W=[0 1;1 0 ]; %W=[a1 0;1 0]
T=M*W; %transformation matrix
RP=[-1.8+j*2.4 -1.8-j*2.4]; %required poles
Rpce=poly(RP); %required characteristic equation
phi=polyvalm(Rpce,A); %caylay hamilton equation
K=[0 1]*inv(M)*phi; %feedback gain
display(K);
%now for the state feedback gain matrix K,u=-Kx_ and we will find Ke
%desired eigen values of Observer matrix is -10,-10
N=[C' A'*C']; %observabilitya matrix
Rop=[-8 -8]; %required observer poles
Roce=poly(Rop); %required characteristic polynomial
Ke=inv(W*N')*([Roce(3);Roce(2)]-[CE(3);CE(2)]);  %observer feedback gain
%Transfer Function of the controller
syms s
TFOC=K*inv(s*eye(2)-A+Ke*C+B*K)*Ke;   %transfer function of the controller
simplify(TFOC); %command to simlify the the equation




