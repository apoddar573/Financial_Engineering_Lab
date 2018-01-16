source("binomialPricingMatrix.R")
S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;
M = 20;
del_t = T/M;

t = seq(0, T, del_t)
disp_t = c(0.5, 1, 1.5, 3, 4.5);
disp_t = disp_t/del_t;
disp_t = disp_t + 1;
disp_t = c(1, disp_t);

callMat = binomialPricingMatrix(S_0, K, T, r, sigma, M, 0);
print(callMat[1:M+1, disp_t])

putMat = binomialPricingMatrix(S_0, K, T, r, sigma, M, 1);
print(putMat[1:M+1, disp_t])
