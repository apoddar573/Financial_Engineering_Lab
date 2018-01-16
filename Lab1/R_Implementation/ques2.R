source("binomialPricingFunction.R")
S_0 = 100;
K = 105;
r = 0.05;
T = 5;
sigma = 0.3;

oneStep = seq(1, 400, 1); 
fiveStep = seq(5, 400, 5);

n_one = length(oneStep);
n_five = length(fiveStep);

callValuesOne = matrix(0, n_one);
for (i in seq(1:n_one) ) {
  callValuesOne[i] = binomialPricing(S_0, K, T, r, sigma, oneStep[i], 0);
}
print(callValuesOne);

callValuesFive = matrix(0, n_five);
for (i in seq(1:n_five) ) {
  callValuesFive[i] = binomialPricing(S_0, K, T, r, sigma, fiveStep[i], 0);
}
print(callValuesFive);

putValuesOne = matrix(0, n_one);
for (i in seq(1:n_one) ) {
  putValuesOne[i] = binomialPricing(S_0, K, T, r, sigma, oneStep[i], 1);
}
print(putValuesOne);

putValuesFive = matrix(0, n_five);
for (i in seq(1:n_five) ) {
  putValuesFive[i] = binomialPricing(S_0, K, T, r, sigma, fiveStep[i], 1);
}
print(putValuesFive);

plot(oneStep, callValuesOne, type = "l", main = "Option Pricing", xlab = "No. of Steps", ylab = "Call Option Price", xlim = c(1, 400))
plot(oneStep, putValuesOne, type = "l", main = "Option Pricing", xlab = "No. of Steps", ylab = "Put Option Price", xlim = c(1, 400))
plot(fiveStep, callValuesFive, type = "l", main = "Option Pricing", xlab = "No. of Steps", ylab = "Call Option Price", xlim = c(5, 400))
plot(fiveStep, putValuesFive, type = "l", main = "Option Pricing", xlab = "No. of Steps", ylab = "Put Option Price", xlim = c(5, 400))
