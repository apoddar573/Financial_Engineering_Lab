function y = lookbackOption(S_0, T, r, sigma, M)
	del_t = T/M;
	u = exp(sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	d = exp(-sigma*sqrt(del_t) + (r - (sigma^2)/2)*del_t );
	rate = exp(r*del_t); 
	if (d<rate & rate<u)
		S(1, 1) = S_0;
		p = (rate - d)/(u-d);
		q = 1-p;
		for j = 1:M
			for i = 1:2^(j - 1)
				S(2*i-1, j+1) = u*S(i, j);
				S(2*i, j+1) = d*S(i, j);
			end
		end
		for i = 1:2^M
			new_i = i;
			max_val = 0;

			for j = M+1:-1:1
				max_val = max(max_val, S(new_i, j));
				new_i = ceil(new_i/2);
			end

				asian(i, M+1) = max_val - S(i, M+1);
		end

		for j = M: -1: 1
			for i = 1:2^(j-1)
				asian(i, j) = (1/rate)*(p*asian(2*i-1, j+1) + q*asian(2*i, j+1));
			end
		end
		y = asian;
	else
		disp('Does not satisfy the no-arbitrage condition')
		y = 0;
	end

end