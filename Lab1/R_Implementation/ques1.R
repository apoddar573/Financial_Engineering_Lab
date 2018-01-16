source("binomialPricingFunction.R")
S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;

A = c(1, 5, 10, 20, 50, 100, 200, 400);

callValues = matrix(0, 8);
for (i in seq(1:8) ) {
  callValues[i] = binomialPricing(S_0, K, T, r, sigma, A[i], 0);
}
print(callValues);

putValues = matrix(0, 8);
for (i in seq(1:8) ) {
  putValues[i] = binomialPricing(S_0, K, T, r, sigma, A[i], 1);
}
print(putValues);


