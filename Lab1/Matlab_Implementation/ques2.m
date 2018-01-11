S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;

M = [1: 1: 400];
M = M';
for i = 1:length(M)
	M(i, 2) = binomialPricingCall(S_0, K, T, r, sigma, M(i));
end

N = [5: 5: 400];
N = N';
for i = 1:length(N)
	N(i, 2) = binomialPricingCall(S_0, K, T, r, sigma, M(i));
end

figure(1);
plot(M(:, 1), M(:, 2));
title('Binomial Pricing for Call Option')
xlabel('M')
ylabel('Value of Call Option at t = 0')
figure(2);
plot(N(:, 1), N(:, 2))
title('Binomial Pricing for Call Option')
xlabel('M')
ylabel('Value of Put Option at t = 0')

M = [1: 1: 400];
M = M';
for i = 1:length(M)
	M(i, 2) = binomialPricingPut(S_0, K, T, r, sigma, M(i));
end

N = [5: 5: 400];
N = N';
for i = 1:length(N)
	N(i, 2) = binomialPricingPut(S_0, K, T, r, sigma, M(i));
end

figure(3);
plot(M(:, 1), M(:, 2));
title('Binomial Pricing for Put Option')
xlabel('M')
ylabel('Value of Call Option at t = 0')
figure(4);
plot(N(:, 1), N(:, 2))
title('Binomial Pricing for Put Option')
xlabel('M')
ylabel('Value of Put Option at t = 0')
