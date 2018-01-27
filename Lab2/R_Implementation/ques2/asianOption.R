asianOption <- function(S_0, K, T, r, sigma, M, flag_rates, flag_Option) {
	del_t = T/M;
	if (flag_rates == 1) {
		u = exp(sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
		d = exp(-sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	} else { 
		u = exp(sigma*sqrt(del_t));
		d = exp(-sigma*sqrt(del_t));
	}
	rate = exp(r*del_t); 
	if (d<rate && rate<u) {
		S = matrix(0,2^M, M+1);
		asian = matrix(0, 2^M, M+1);
		S[1, 1] = S_0;
		p = (rate - d)/(u-d);
		q = 1-p;
		for (j in 1:M) {
			for (i in seq(1:2^(j - 1))) {
				S[2*i-1, j+1] = u*S[i, j];
				S[2*i, j+1] = d*S[i, j];
			}
		}
		for (i in 1:2^M) {
			new_i = i;
			avg_val = 0;

			for (j in seq(M+1, 1, -1)) {
				avg_val = avg_val + S[new_i, j]/(M+1);
				new_i = ceiling(new_i/2);
			}
			if (flag_Option == 0) {
				asian[i, M+1] = max(0, avg_val-K);
			} else {
				asian[i, M+1] = max(0, K-avg_val);
			}
		}

		for (j in seq(M, 1, -1)) {
			for (i in seq(1:2^(j-1)))
				asian[i, j] = (1/rate)*(p*asian[2*i-1, j+1] + q*asian[2*i, j+1]);
			end
		}
		return(asian[1, 1]);
	} else {
		print('Does not satisfy the no-arbitrage condition')
		return(0);
	}
}