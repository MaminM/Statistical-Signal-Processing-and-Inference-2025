function [MDL, AIC] = MDL_and_AIC(x,p)
N = length(x);
for i = 1:p
    [~,E] = aryule(x,i);
    MDL(i) = log10(E) + i*(log10(N)/N);
    AIC(i) = log10(E) + 2*(i/N);
end