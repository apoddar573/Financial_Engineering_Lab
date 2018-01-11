S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;
M = 20;
del_t = T/M;

t = linspace(0, T, M+1)
disp_t = [ 0.5, 1, 1.5, 3, 4.5];
disp_t = disp_t/del_t;
disp_t = disp_t + 1;
disp_t = [1 disp_t];

callMat = binomialPricingCallMatrix(S_0, K, T, r, sigma, M);
callMat = [t; callMat];
dlmwrite('ques3.csv',callMat(:, disp_t),'delimiter',',');
disp(callMat(:, disp_t))

putMat = binomialPricingPutMatrix(S_0, K, T, r, sigma, M);
putMat = [t; putMat];
dlmwrite('ques3.csv',putMat(:, disp_t),'delimiter',',','-append');
disp(putMat(:, disp_t))