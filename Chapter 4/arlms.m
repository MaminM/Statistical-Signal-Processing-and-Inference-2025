function [yEst, coeffs, err] = arlms(x, step, order)
    N = length(x);
    yEst = zeros(1, N);
    err = zeros(1, N);
    coeffs = zeros(order, N);

    for i = order + 1 : N
        yEst(i) = coeffs(:, i).' * x(i - 1 : -1 : i - order).';
        err(i) = x(i) - yEst(i);
        coeffs(:, i + 1) = coeffs(:, i) + step * err(i) * x(i - 1 : -1 : i - order).';
    end
end