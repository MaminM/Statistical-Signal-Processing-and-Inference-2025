function y=pgm(x)

    N = length(x);
    y = zeros(N, 1);
    
    n = 0:N-1;
    n = n';
    for i=1:N
        term = abs((sum(x .* exp(-1j*2*pi*(i-1/N)*(n/N))))).^2;
        term = (1/N) * term;
        y(i) = term;
    end

end

