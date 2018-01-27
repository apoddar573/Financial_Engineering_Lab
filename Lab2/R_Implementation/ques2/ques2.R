source("asianOption.R")

S_O = 100;
K = 100;
T = 1;
M = 10;
r = 0.08;
sigma = 0.2;

# ==========================================================================================================================
# varying S_O
X = seq(50, 150, 1);
len_x = length(X);

temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(X[i], K, T, r, sigma, M, 0, 0);
}
# print(temp_values);
jpeg("Call_SetA_S_O.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "S(0)", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(X[i], K, T, r, sigma, M, 1, 0);
}
# print(temp_values);
jpeg("Call_SetB_S_O.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "S(0)", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(X[i], K, T, r, sigma, M, 0, 1);
}
# print(temp_values);
jpeg("Put_SetA_S_O.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "S(0)", ylab = "Value of Put Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(X[i], K, T, r, sigma, M, 1, 1);
}
# print(temp_values);
jpeg("Put_SetB_S_O.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "S(0)", ylab = "Value of Put Option at t = 0");
dev.off()

# ==========================================================================================================================
# varying K
X = seq(50, 150, 1);
len_x = length(X);

temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, X[i], T, r, sigma, M, 0, 0);
}
# print(temp_values);
jpeg("Call_SetA_K.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "K", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, X[i], T, r, sigma, M, 1, 0);
}
# print(temp_values);
jpeg("Call_SetB_K.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "K", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, X[i], T, r, sigma, M, 0, 1);
}
# print(temp_values);
jpeg("Put_SetA_K.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "K", ylab = "Value of Put Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, X[i], T, r, sigma, M, 1, 1);
}
# print(temp_values);
jpeg("Put_SetB_K.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "K", ylab = "Value of Put Option at t = 0");
dev.off()

# ==========================================================================================================================
# varying r
X = seq(0.05, 0.15, 0.01);
len_x = length(X);

temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, X[i], sigma, M, 0, 0);
}
# print(temp_values);
jpeg("Call_SetA_r.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "r", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, X[i], sigma, M, 1, 0);
}
# print(temp_values);
jpeg("Call_SetB_r.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "r", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, X[i], sigma, M, 0, 1);
}
# print(temp_values);
jpeg("Put_SetA_r.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "r", ylab = "Value of Put Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, X[i], sigma, M, 1, 1);
}
# print(temp_values);
jpeg("Put_SetB_r.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "r", ylab = "Value of Put Option at t = 0");
dev.off()


# ==========================================================================================================================
# varying sigma
X = seq(0.10, 0.30, 0.01);
len_x = length(X);

temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, X[i], M, 0, 0);
}
# print(temp_values);
jpeg("Call_SetA_sigma.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "sigma", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, X[i], M, 1, 0);
}
# print(temp_values);
jpeg("Call_SetB_sigma.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "sigma", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, X[i], M, 0, 1);
}
# print(temp_values);
jpeg("Put_SetA_sigma.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "sigma", ylab = "Value of Put Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, X[i], M, 1, 1);
}
# print(temp_values);
jpeg("Put_SetB_sigma.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "sigma", ylab = "Value of Put Option at t = 0");
dev.off()


# ==========================================================================================================================
# varying M
X = seq(2, 12, 1);
len_x = length(X);

temp_values = matrix(0, len_x);
temp_values1 = matrix(0, len_x);
temp_values2 = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, sigma, X[i], 0, 0);
}
# print(temp_values);
for (i in seq(1:len_x)) {
	temp_values1[i] = asianOption(S_O, 95, T, r, sigma, X[i], 0, 0);
}
# print(temp_values1);
for (i in seq(1:len_x)) {
	temp_values2[i] = asianOption(S_O, 105, T, r, sigma, X[i], 0, 0);
}
# print(temp_values2);

jpeg("Call_SetA_M_100.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()
jpeg("Call_SetA_M_95.jpg")
plot(X, temp_values1, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()
jpeg("Call_SetA_M_105.jpg")
plot(X, temp_values2, type = "l", main = "Binomial Pricing for Call Option: Set A", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
temp_values1 = matrix(0, len_x);
temp_values2 = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, sigma, X[i], 1, 0);
}
for (i in seq(1:len_x)) {
	temp_values1[i] = asianOption(S_O, 95, T, r, sigma, X[i], 1, 0);
}
for (i in seq(1:len_x)) {
	temp_values2[i] = asianOption(S_O, 105, T, r, sigma, X[i], 1, 0);
}
# print(temp_values)
jpeg("Call_SetB_M_100.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()
jpeg("Call_SetB_M_95.jpg")
plot(X, temp_values1, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()
jpeg("Call_SetB_M_105.jpg")
plot(X, temp_values2, type = "l", main = "Binomial Pricing for Call Option: Set B", xlab = "M", ylab = "Value of Call Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
temp_values1 = matrix(0, len_x);
temp_values2 = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, sigma, X[i], 0, 1);
}
for (i in seq(1:len_x)) {
	temp_values1[i] = asianOption(S_O, 95, T, r, sigma, X[i], 0, 1);
}
for (i in seq(1:len_x)) {
	temp_values2[i] = asianOption(S_O, 105, T, r, sigma, X[i], 0, 1);
}
# print(temp_values);
jpeg("Put_SetA_M_100.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()
jpeg("Put_SetA_M_95.jpg")
plot(X, temp_values1, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()
jpeg("Put_SetA_M_105.jpg")
plot(X, temp_values2, type = "l", main = "Binomial Pricing for Put Option: Set A", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()


temp_values = matrix(0, len_x);
temp_values1 = matrix(0, len_x);
temp_values2 = matrix(0, len_x);
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, K, T, r, sigma, X[i], 1, 1);
}
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, 95, T, r, sigma, X[i], 1, 1);
}
for (i in seq(1:len_x)) {
	temp_values[i] = asianOption(S_O, 105, T, r, sigma, X[i], 1, 1);
}
# print(temp_values);
jpeg("Put_SetB_M_100.jpg")
plot(X, temp_values, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()
jpeg("Put_SetB_M_95.jpg")
plot(X, temp_values1, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()
jpeg("Put_SetB_M_105.jpg")
plot(X, temp_values2, type = "l", main = "Binomial Pricing for Put Option: Set B", xlab = "M", ylab = "Value of Put Option at t = 0");
dev.off()







