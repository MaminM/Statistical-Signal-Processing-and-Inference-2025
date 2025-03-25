%% Question 1 and 2
clear all
close all
clc
coeffs = [1, 0.9, 0.2];
noise = randn(1, 3000);
inputSig = filter(1, coeffs, noise);
%adaptive parameters
stepSizes = [0.001 0.01 0.02 0.05];
for i = 1:length(stepSizes)
    %model order is AR(2)
    [yEst, adaptCoeffs, err] = arlms(inputSig, stepSizes(i), 2);
    L = length(adaptCoeffs);
    figure;
    plot(1:L, adaptCoeffs(1,:), 'k', 'DisplayName', 'a_1');
    hold on;
    plot(1:L, adaptCoeffs(2,:), 'r', 'DisplayName', 'a_2');
    hold off;
    grid on;
    xlim([1 L]);
    xlabel('Iteration');
    ylabel('Parameter Estimate');
    legend; % Add legend
    title(sprintf('Estimated parameters for AR(2) process, \\mu=%1.4f', stepSizes(i))); 
end


%%

%% Question 1 and 2
clear all
close all
clc
coeffs = [1, 0.9, 0.2];
noise = randn(1, 3000);
inputSig = filter(1, coeffs, noise);
%adaptive parameters
stepSizes = [0.001 0.01 0.02 0.05];

figure; % Create a single figure for all plots

for i = 1:length(stepSizes)
    %model order is AR(2)
    [yEst, adaptCoeffs, err] = arlms(inputSig, stepSizes(i), 2);
    L = length(adaptCoeffs);

    subplot(2, 2, i); % Create subplots in a 2x2 grid

    plot(1:L, adaptCoeffs(1,:), 'k', 'DisplayName', 'a_1');
    hold on;
    plot(1:L, adaptCoeffs(2,:), 'r', 'DisplayName', 'a_2');
    hold off;
    grid on;
    xlim([1 L]);
    xlabel('Iteration');
    ylabel('Parameter Estimate');
    legend; % Add legend
    title(sprintf('Estimated parameters for AR(2) process, \\mu=%1.4f', stepSizes(i))); 
end