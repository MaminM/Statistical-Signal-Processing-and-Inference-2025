%% Question 1

% generate white gaussian noise
N = 1000; % 1000-samples per realisation
M = 1; % 1 realisation
x = randn(M,N);

x_corr = xcorr(x, 'unbiased');
tau = (1:1999) - 1000;

figure;
plot(tau, x_corr); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('xcorr of Gaussian Noise'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)


