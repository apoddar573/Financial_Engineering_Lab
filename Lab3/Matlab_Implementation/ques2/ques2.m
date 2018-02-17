S_0 = 100;
K = 100;
T = 1;
M = 10;
r = 0.08;
sigma = 0.2;

% varying M
X = [5, 10, 25, 50];
X = X';
n = length(X);

p = lookbackOption(S_0, T, r, sigma, 5);
disp(p)

for i = 1:n
	y = lookbackOption(S_0, T, r, sigma, X(i, 1));
	X(i, 2) = y(1, 1)
end

