M = [0.1; 0.2 ; 0.15];

Cov = [0.005, -0.010, 0.004; -0.010, 0.040, -0.002; 0.004, -0.002, 0.023]

I = [1; 1; 1];

stdevs=sqrt(diag(Cov));
A = I'*inv(Cov)*I;
B = I'*inv(Cov)*M;
C = M'*inv(Cov)*M;
delta = A*C - B^2;

% ======================================================================================================
% part 1

frontierMean = linspace(0.00, 1.00, 101);
frontierVar = (A*(frontierMean .^ 2) - 2*B*frontierMean + C)/delta;
frontierSigma = sqrt(frontierVar);
fig1 = figure()
plot(frontierSigma, frontierMean)
grid
title('Efficient Frontier')
ylabel('Mean Return')
xlabel('Mean Risk')
saveas(fig1, 'efficientFrontier_q1.jpg')

% =======================================================================================================
% part 2

w_g = (inv(Cov)*I)/A;
u_g = B/A;
var_g = 1/A;
sigma_g = sqrt(var_g);

w_d = (inv(Cov)*M)/B;
u_d = w_d'*M;
var_d = w_d'*C*w_d;
sigma_d = sqrt(var_d);

ret_mat = linspace(0.1, 1.00, 10);
ret_mat = ret_mat';	

var_mat = (A*(ret_mat .^ 2) - 2*B*ret_mat + C)/delta;
sig_mat = sqrt(var_mat);

for i = 1:10
	lambda = (C - ret_mat(i)*B)/delta;
	gama = (ret_mat(i)*A - B)/delta;
	wt_mat(i, :) = (lambda*A)*w_g + (gama*B)*w_d;
end

disp(ret_mat)
disp(sig_mat)
disp(wt_mat)


% =================================================================================================================
% part 3
syms u

eqn = (A*u^2 - 2*B*u + C)/delta == 0.15;
sol_u = vpa(solve(eqn, u));
max_u = sol_u(2, 1)
min_u = sol_u(1, 1);

lambda = (C - max_u*B)/delta;
gama = (max_u*A - B)/delta;
max_wt = (lambda*A)*w_g + (gama*B)*w_d;

lambda = (C - min_u*B)/delta;
gama = (min_u*A - B)/delta;
min_wt = (lambda*A)*w_g + (gama*B)*w_d;

disp(max_u)
disp(max_wt)

disp(min_u)
disp(min_wt)

% ====================================================================================================================
% part 4

ret = 0.18;
sig = (A*ret^2 - 2*B*ret + C)/delta;

lambda = (C - ret*B)/delta;
gama = (ret*A - B)/delta;
wt = (lambda*A)*w_g + (gama*B)*w_d;

disp(sig)
disp(wt)


% ====================================================================================================================
% part 5

ret = 0.10;
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
saveas(fig1, 'capm_q1.jpg')

% =====================================================================================================================
% part 6


















