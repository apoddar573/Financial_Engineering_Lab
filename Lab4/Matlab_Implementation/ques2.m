data = xlsread('data_ques2.xlsx');
M = (data(2:end, :) - data(1:end-1, :)) ./data(1:end-1, :);
M = mean(M);
M = M';

Cov = cov(data)

I = ones(length(M), 1);

A = I'*inv(Cov)*I;
B = I'*inv(Cov)*M;
C = M'*inv(Cov)*M;

delta = A*C - B^2;

% ======================================================================================================
% part 1

frontierMean = linspace(-0.2, 1.00, 101);
frontierVar = (A*(frontierMean .^ 2) - 2*B*frontierMean + C)/delta;
frontierSigma = sqrt(frontierVar);
fig1 = figure()
plot(frontierSigma, frontierMean)
title('Efficient Frontier')
ylabel('Mean Return')
xlabel('Mean Risk')
saveas(fig1, 'efficientFrontier_q2.jpg')

% ====================================================================================================================
% ques 5

w_g = inv(Cov)*I/A
u_g = B/A;
var_g = 1/A;
sigma_g = sqrt(var_g);

w_d = inv(Cov)*M/B
u_d = w_d'*M;
var_d = w_d'*C*w_d;
sigma_d = sqrt(var_d);

ret = 0.26;
sig = 0;

lambda = (C - ret*B)/delta;
gama = (ret*A - B)/delta;
wt = (lambda*A)*w_g + (gama*B)*w_d;

disp(sig)
disp(wt)

z_t = (C-B*ret)/(B-A*ret);
sigma_t = sqrt((C - 2*B*ret + A*ret^2)/(B - A*ret)^2);

ret_t = 0.01:0.01:0.30;
sig_t = sigma_t*(ret_t - ret)/(z_t - ret);
hold on;
plot(sig_t, ret_t)
grid
saveas(fig1, 'capm_q2.jpg')
%------------------------d-----------------------
returns=[];
fig2 = figure(2)
for i=1:length(M)
    beta=0:0.1:5;
    R1=0;
    returns=R1+(M(i)-R1)*beta;
    plot(beta,returns);
    hold on
end
grid;
xlabel('\beta');
ylabel('\mu');
title('Security Market Lines for 10 assets');
saveas(fig2, 'securityLines_q2.jpg')