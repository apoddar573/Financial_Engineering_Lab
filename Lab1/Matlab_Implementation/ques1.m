S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;

M = [1; 5; 10; 20; 50; 100; 200; 400];
for i = 1:length(M)
	M(i, 2) = binomialPricingCall(S_0, K, T, r, sigma, M(i));
end
disp(M)
N = [1; 5; 10; 20; 50; 100; 200; 400];
for i = 1:length(N)
	N(i, 2) = binomialPricingPut(S_0, K, T, r, sigma, M(i));
end
disp(N)
