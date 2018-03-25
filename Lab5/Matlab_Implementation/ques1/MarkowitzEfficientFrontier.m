function [port_mean_vec, port_var_vec] = MarkowitzEfficientFrontier(mean_vec, cov_mat)
    n = length(mean_vec);
    u = ones(1, n);
    a = (u / cov_mat) * u';
    b = (u / cov_mat) * mean_vec';
    c = (mean_vec / cov_mat) * mean_vec';
    del = (a * c) - (b * b);
    port_mean_vec = 0:0.01:0.3;
    port_var_vec = (a * (port_mean_vec .^ 2)) - (2 * b * port_mean_vec) + c;
    port_var_vec = port_var_vec / del;
end