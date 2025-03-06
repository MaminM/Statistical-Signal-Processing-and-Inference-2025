%% Question 1

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
plot(tau_small, x_corr_small); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('xcorr of Gaussian Noise: Zoomed in'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)


% zoom into small tau
tau_large = (49:999);
x_corr_large = x_corr(49+1000:999+1000);

figure;
plot(tau_large, x_corr_large); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('xcorr of Gaussian Noise: Zoomed out'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)

%% Question 3

% Explain...


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
title('ACF of y'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)


