%% Question 1 and 2
clear all
close all
clc

coeffs = [1, 0.9, 0.2];
noise = randn(1, 3000);
inputSig = filter(1, coeffs, noise);
%adaptive parameters
stepSizes = [0.001 0.05];
for i = 1:length(stepSizes)
    %model order is AR(2)
    [yEst, adaptCoeffs, err] = arlms(inputSig, stepSizes(i), 2);
    L = length(adaptCoeffs);
    figure;
    plot(1:L, adaptCoeffs.')
        grid on;
        xlim([1 L]);
        xlabel('Iteration');
        ylabel('Parameter Estimate');
        legend('a_1', 'a_2');
        title(sprintf('Estimated parameters for AR(2) process, \\mu=%1.3f', stepSizes(i))); 
end


