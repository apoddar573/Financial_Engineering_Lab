function [weights_eqn] = WeightsByPortfolioMean(M, C)
    syms x;
    u = ones(1, length(M));
    v1 = u / C * M';
    v2 = M / C * M';
    v3 = u / C * u';
    v4 = M / C * u';
    weights_eqn = ((det([1 v1; x v2]) * (u / C)) + (det([v3 1; v4 x]) * (M / C))) / det([v3 v1; v4 v2]);
end
