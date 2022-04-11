%BANDWIDTH IS FREQUENCY DOMAIN CONCEPT .IT IS THE FREQUENCY WHEN THE SYSTEM
%magnitude IS DEGRADED MORE THAN 3DB from the initial magnitude IN BODE PLOT. DEGRADED MEANS SYSYTEM BECOME BAD
%AT TRACKING THE INPUT SIGNAL.
clear 
clc
close all
P_num=[1256];
P_den=[1 1021 4845];
P=tf(P_num,P_den);
%compensator transfer function
K=5;
C=tf([K],[1]);
%let feedback is 1
T=minreal(C*P/(1+C*P)) %ZERO POLE CANCELLATION,WITHOUT IT ORDER OF TF IS 4
% T=feedback(P*C,1,+1)
figure
bode(T);
grid on
