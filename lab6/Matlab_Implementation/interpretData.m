function r = interpretData(data)
	[n, m] = size(data);
	r = (data(1:n-1, :) - data(2:n, :)) ./ data(2:n, :);
	meanr = mean(r);
	means = sqrt(var(r));
	for i = 1:m
		r(1:n-1, i) = (r(1:n-1, i) - meanr(i))/means(i);
	end
end 