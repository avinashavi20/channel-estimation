clc;clear all;close all;
h=5; %true parameter to be estimated

num_exp =10000; % number of experiment
sigma_sq_db=0;%noise variance in db
sigma_sq =10^(sigma_sq_db/10);%noise variance in normal scale
N=100 % number of observations
y= h+ sqrt(sigma_sq)*randn(N,num_exp); %generation of model y=h +v
hhat=sum(y,1)/N; %estimated parameter
histogram(hhat,'normalization','pdf','EdgeColor','b','facecolor','b');%pdf generation
hold on;

var_est=sigma_sq/N; %theoretical variance of estimate
range=[3.5:0.01:6.5];
plot(range,1/sqrt(2*pi*var_est)*exp(-(range-h).^2/2/var_est),'r','linewidth',2.5);
grid on;
xlabel('h est');
ylabel('f_H(h)');
title('pdf of the estimate for N=100');
legend('experimental pdf','theoretical pdf');
