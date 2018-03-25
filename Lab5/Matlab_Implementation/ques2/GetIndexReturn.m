function [ind_ret] = GetIndexReturn(prices)
    n = length(prices);
    rets = (prices(1:n-1) - prices(2:n)) ./ prices(2:n);
    ind_ret = mean(rets) * 12;
end
