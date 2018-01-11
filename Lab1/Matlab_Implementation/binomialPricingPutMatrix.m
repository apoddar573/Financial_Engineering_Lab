function S = binomialPricingPutMatrix(S_0, K, T, r, sigma, M )
	del_t = T/M;
	u = exp(sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	d = exp(-sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	rate = exp(r*del_t); 
	if (d<rate & rate<u)
		n = M;
		p = (rate - d)/(u-d);
		q = 1-p;
		for i = 1:n+1
			S(i, n+1) = u^(n+1-i) * d^(i-1) * S_0;
			S(i, n+1) = max(0, K - S(i, n+1));
		end
		for i = 1:n
			for j = 1:n-i+1
				S(j, n-i+1) = (1/(rate))*( p*S(j, n-i+2) + q*S(j+1, n-i+2));
			end
		end
	else
		disp('Does not satisfy the no-arbitrage condition')
		S = 0;
	end
end
