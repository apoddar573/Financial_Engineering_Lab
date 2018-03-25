function [ind_rets] = ReturnMean(prices)
    p_size = size(prices);
    n = p_size(2);
    m = p_size(1);
    ind_rets = zeros(1, n);
    for i = 1:n
        v1 = prices(:, i);
        rets = (v1(1:m-1) - v1(2:m)) ./ v1(2:m);
        ind_rets(i) = mean(rets) * 12;
    end
end