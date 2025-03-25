%% Question 1
clc
close all
clear all
% generate white gaussian noise
N = 1000; % 1000-samples per realisation
M = 1; % 1 realisation
x = randn(M,N);

x_corr = xcorr(x, 'unbiased');
tau = (-999:999);

figure;
plot(tau, x_corr); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('xcorr of Gaussian Noise'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)

%% Question 2

% zoom into small tau
tau_small = (-49:49);
x_corr_small = x_corr(-49+1000:49+1000);

figure;
% Subplot 1: Zoomed in
subplot(1, 2, 1);
plot(tau_small, x_corr_small);
xlabel('Sample number', 'FontSize', 15);
ylabel('Value ', 'FontSize', 15);
title('xcorr of Gaussian Noise: Small \tau');
grid on;
grid minor;
set(gca, 'FontSize', 15); % Set fontsize for current axes
% ylim([-0.2 1.1])
% Subplot 2: Zoomed out
tau_large = (49:999);
x_corr_large = x_corr(49+1000:999+1000);
subplot(1, 2, 2);
plot(tau_large, x_corr_large);
xlabel('Sample number', 'FontSize', 15);
ylabel('Value ', 'FontSize', 15);
title('xcorr of Gaussian Noise: Large \tau');
grid on;
grid minor;
set(gca, 'FontSize', 15); % Set fontsize for current axes
% ylim([-0.5 1.1])

% %% correcting for the factor 1/(N-|tau|)
% x_corr_large_corrected = x_corr_large .* (N-abs(tau_large));
% 
% figure;
% plot(tau_large, x_corr_large_corrected); % Scatter plot with indices on the x-axis
% xlabel('Sample number', FontSize=15); % Label for x-axis
% ylabel('Value ', FontSize=15); % Label for y-axis
% title('xcorr of Gaussian Noise: Zoomed out (Corrected)'); % Title for the plot
% grid on; % Enable grid for better visibility
% fontsize("scale", 1.5)


%% Question 4

M = 1; % 1 realisation
N = 1000; % 1000 samples per realisation

x = randn(M,N);
y = filter(ones(1,9), [1], x);
y_corr = xcorr(y, 'unbiased');

% plot
tau_zoomed = -20:20;
y_corr_zoomed = y_corr(-20+1000:20+1000);

figure;
stem(tau_zoomed, y_corr_zoomed, 'filled'); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('ACF of y | order 9'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)


y2 = filter(ones(1,5), [1], x);
y2_corr = xcorr(y2, 'unbiased');

%% Question 4
M = 1; % 1 realisation
N = 1000; % 1000 samples per realisation
x = randn(M,N);
y = filter(ones(1,9), [1], x);
y_corr = xcorr(y, 'unbiased');

y2 = filter(ones(1,5), [1], x);
y2_corr = xcorr(y2, 'unbiased');

% plot
tau_zoomed = -20:20;
y_corr_zoomed = y_corr(-20+1000:20+1000);
y2_corr_zoomed = y2_corr(-20+1000:20+1000);

figure;

% Subplot 1: ACF of y | order 9
subplot(1, 2, 1);
stem(tau_zoomed, y_corr_zoomed, 'filled');
xlabel('Sample number', 'FontSize', 15);
ylabel('Value ', 'FontSize', 15);
title('ACF of y | order 9');
grid on;
grid minor
set(gca, 'FontSize', 15);

% Subplot 2: ACF of y2 | order 5
subplot(1, 2, 2);
stem(tau_zoomed, y2_corr_zoomed, 'filled');
xlabel('Sample number', 'FontSize', 15);
ylabel('Value ', 'FontSize', 15);
title('ACF of y2 | order 5');
grid on;
grid minor
set(gca, 'FontSize', 15);



