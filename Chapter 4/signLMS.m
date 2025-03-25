function [y, e, w] = signLMS(x, z, u, order, algorithmType)
    start = order + 1;
    nw = order - 1;
    w(:, start - 1) = zeros(nw, 1);
    y(start - 1) = 0;

    for i = start : length(x) + 1
        xRev = flipud(x(i - nw : i - 1));
        y(i - 1) = transpose(w(:, i - 1)) * xRev;
        e(i - 1) = z(i - 1) - y(i - 1);

        switch algorithmType
            case 0 % NLMS
                uA = u / (0.001 + xRev' * xRev); % gear shifting
                w(:, i) = w(:, i - 1) + uA * e(i - 1) * xRev;
            case 1 % sign-error
                w(:, i) = w(:, i - 1) + u * sign(e(i - 1)) * xRev;
            case 2 % sign-regressor
                w(:, i) = w(:, i - 1) + u * e(i - 1) * sign(xRev);
            case 3 % sign-sign
                w(:, i) = w(:, i - 1) + u * sign(e(i - 1)) * sign(xRev);
            otherwise
                error('Invalid algorithmType. Use 0, 1, 2, or 3.');
        end
    end
end