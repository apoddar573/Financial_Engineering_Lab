function y = binomialPricingOption(S_0, K, T, r, sigma, M, flag_rates, flag_Option)
	del_t = T/M;
	if flag_rates == 1
		u = exp(sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
		d = exp(-sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	else 
		u = exp(sigma*sqrt(del_t));
		d = exp(-sigma*sqrt(del_t));
	end
	rate = exp(r*del_t); 
	if (d<rate & rate<u)
		n = M;
		p = (rate - d)/(u-d);
		q = 1-p;
		for i = 1:n+1
			S(i, n+1) = u^(n+1-i) * d^(i-1) * S_0;
			if flag_Option == 0
				S(i, n+1) = max(S(i, n+1) - K, 0);
			else 
				S(i, n+1) = max(K - S(i, n+1), 0);
			end				
		end
		for i = 1:n
			for j = 1:n-i+1
				S(j, n-i+1) = (1/(rate))*( p*S(j, n-i+2) + q*S(j+1, n-i+2));
			end
		end
		y = S(1, 1);
	else
		disp('Does not satisfy the no-arbitrage condition')
		y = 0;
	end
end
