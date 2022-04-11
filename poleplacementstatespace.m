A=[0 1 0;0 0 1;-1 -5 -6];
B=[0;0;1];
M=[B A*B A*A*B]; %controlability matrix
determinent=det(M);
CE=charpoly(A);% characteristic equation 
W=[CE(3) CE(2) 1;CE(2)  1 0;1 0 0]; 
T=M*W; %transformation matrix
RP=[-2+j*4 -2-j*4 -10]; %required poles
Rpce=poly(RP); %required characteristic equation
phi=polyvalm(Rpce,A); %caylay hamilton equation
K=[0 0 1]*inv(M)*phi; %feedback gain
display(K);


%or we can directly use ackerman command
KK=acker(A,B,RP);
