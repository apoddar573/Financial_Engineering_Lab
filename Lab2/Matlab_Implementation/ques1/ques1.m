S_0 = 100;
K = 100;
T = 1;
M = 100;
r = 0.08;
sigma = 0.2;

%varying S_0 for 1 rates
X = [50: 1: 150];
X = X';
n = length(X);

for i = 1:n
	X(i, 2) = binomialPricingOption(X(i, 1), K, T, r, sigma, M, 0, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set A')
xlabel('S(0)')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetA_S_0.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(X(i, 1), K, T, r, sigma, M, 0, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set A')
xlabel('S(0)')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetA_S_0.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(X(i, 1), K, T, r, sigma, M, 1, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set B')
xlabel('S(0)')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetB_S_0.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(X(i, 1), K, T, r, sigma, M, 1, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set B')
xlabel('S(0)')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetB_S_0.png')

% ===============================================================================================

%varying K 
X = [50: 1: 150];
X = X';
n = length(X);

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, X(i, 1), T, r, sigma, M, 0, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set A')
xlabel('K')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetA_K.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, X(i, 1), T, r, sigma, M, 0, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set A')
xlabel('K')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetA_K.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, X(i, 1), T, r, sigma, M, 1, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set B')
xlabel('K')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetB_K.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, X(i, 1), T, r, sigma, M, 1, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set B')
xlabel('K')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetB_K.png')

% ===============================================================================================

% varying r 
X = [0.05: 0.01: 0.15];
X = X';
n = length(X);

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, X(i, 1), sigma, M, 0, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set A')
xlabel('r')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetA_r.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, X(i, 1), sigma, M, 0, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set A')
xlabel('r')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetA_r.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, X(i, 1), sigma, M, 1, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set B')
xlabel('r')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetB_r.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, X(i, 1), sigma, M, 1, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set B')
xlabel('r')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetB_r.png')

% ===============================================================================================

% varying sigma 
X = [0.10: 0.01: 0.30];
X = X';
n = length(X);

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, X(i, 1), M, 0, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set A')
xlabel('sigma')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetA_sigma.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, X(i, 1), M, 0, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set A')
xlabel('sigma')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetA_sigma.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, X(i, 1), M, 1, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set B')
xlabel('sigma')
ylabel('Value of Call Option at t = 0')
saveas(fig1, 'Call_SetB_sigma.png')

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, X(i, 1), M, 1, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set B')
xlabel('sigma')
ylabel('Value of Put Option at t = 0')
saveas(fig1, 'Put_SetB_sigma.png')


% ===============================================================================================

% varying M
X = [50: 1: 450];
X = X';
n = length(X);
K1 = 95;
K2 = 105;

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, sigma, X(i, 1), 0, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
hold on;
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K1, T, r, sigma, X(i, 1), 0, 0)
end
plot(X(:, 1), X(:, 2));
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K2, T, r, sigma, X(i, 1), 0, 0)
end
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set A')
xlabel('M')
ylabel('Value of Call Option at t = 0')
legend('K = 100', 'K = 95', 'K = 105' )
saveas(fig1, 'Call_SetA_M.png')
hold off;

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, sigma, X(i, 1), 0, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
hold on;
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K1, T, r, sigma, X(i, 1), 0, 1)
end
plot(X(:, 1), X(:, 2));
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K2, T, r, sigma, X(i, 1), 0, 1)
end
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set A')
xlabel('M')
ylabel('Value of Put Option at t = 0')
legend('K = 100', 'K = 95', 'K = 105' )
saveas(fig1, 'Put_SetA_M.png')
hold off;

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, sigma, X(i, 1), 1, 0)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
hold on;
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K1, T, r, sigma, X(i, 1), 1, 0)
end
plot(X(:, 1), X(:, 2));
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K2, T, r, sigma, X(i, 1), 1, 0)
end
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Call Option: Set B')
xlabel('M')
ylabel('Value of Call Option at t = 0')
legend('K = 100', 'K = 95', 'K = 105' )
saveas(fig1, 'Call_SetB_M.png')
hold off;

for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K, T, r, sigma, X(i, 1), 1, 1)
end
fig1 = figure(1);
plot(X(:, 1), X(:, 2));
hold on;
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K1, T, r, sigma, X(i, 1), 1, 1)
end
plot(X(:, 1), X(:, 2));
for i = 1:n
	X(i, 2) = binomialPricingOption(S_0, K2, T, r, sigma, X(i, 1), 1, 1)
end
plot(X(:, 1), X(:, 2));
title('Binomial Pricing for Put Option: Set B')
xlabel('M')
ylabel('Value of Put Option at t = 0')
legend('K = 100', 'K = 95', 'K = 105' )
saveas(fig1, 'Put_SetB_M.png')
hold off;