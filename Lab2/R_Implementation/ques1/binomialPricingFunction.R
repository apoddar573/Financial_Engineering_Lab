binomialPricing <- function(S_0, K, T, r, sigma, M, prob_flag, option_flag) {
	del_t = T/M;
	if (prob_flag == 1) {
	u = exp(sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	d = exp(-sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	} else {
		u = exp(sigma*sqrt(del_t));
		d = exp(-sigma*sqrt(del_t));
	}
	rate = exp(r*del_t);
	if(d<rate && rate<u) {
		S = matrix(0, M+1, M+1);
		p = (rate-d)/(u-d);
		q = 1-p;
		for (i in 1:M+1) {
			S[i, M+1] = u^(M+1-i)*d^(i-1)*S_0;
			if (option_flag == 0) {
				S[i, M+1] = max(0, S[i, M+1] - K);
			} else {
				S[i, M+1] = max(0, K - S[i, M+1]);
			}
		}
		for (i in 1:M) {
			for(j in seq(1:M-i+1)) {
				S[j, M-i+1] = (1/(rate))*( p*S[j, M-i+2] + q*S[j+1, M-i+2] ) ;
			}
		}
		return(S[1, 1]);	
	} else {
		print('Does not satisfy no-arbitrage condition');
		return(0);
	}
}
