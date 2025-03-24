%% Question 1a.

clear all 
close all 
clc

% Load and preprocess data
load NASDAQ.mat

data = NASDAQ(:, 2);
data = table2array(data);
data_scaled = zscore(data); % Zero-mean, unit variance

MAX_MODEL_ORDER = 10; 
OFFSET = (length(data) - 1)/2;

a_matrix = zeros(MAX_MODEL_ORDER,MAX_MODEL_ORDER);
% PACF defined in Lec 2, Appendix 5 as the diagonal of a_matrix
pacf = zeros(1, MAX_MODEL_ORDER);

% compute coefficients
for p=1:MAX_MODEL_ORDER
    [aryule_a,aryule_e] = aryule(data, p);
    a_matrix(p, 1:p) = -1 * aryule_a(2:p+1);
    pacf(1, p) = a_matrix(p, p);
end

% zero mean and unit variance
data_scaled_ACF = xcorr(data_scaled, 'unbiased');

% Finding Yule Walker Coefficients
data = data_scaled_ACF;
MAX_MODEL_ORDER = 10; 
OFFSET = (length(data) - 1)/2;

a_scaled_matrix = zeros(MAX_MODEL_ORDER,MAX_MODEL_ORDER);
% storing PACF as defined in Lec 2, Appendix 5 as the diagonal of a_matrix
pacf_scaled = zeros(1, MAX_MODEL_ORDER);

% compute coefficients
for p=1:MAX_MODEL_ORDER
    [aryule_a,aryule_e] = aryule(data, p);
    a_scaled_matrix(p, 1:p) = -1 * aryule_a(2:p+1);
    pacf_scaled(1, p) = a_scaled_matrix(p, p);
end

% Combined PACF Plot
figure;
hold on;

% Plot scaled PACF with stem plot
stem(1:length(pacf), pacf, 'b', 'LineWidth', 1, 'DisplayName','original'); % Blue, thinner, dashed
% zero mean, unit variance
stem(1:length(pacf_scaled), pacf_scaled, 'k', 'LineWidth', 1.5, 'DisplayName', '$\mu = 0$, $\sigma = 1$');


% Plot confidence intervals (hide from legend)
plot(0:length(pacf_scaled)+1, ones(1, length(pacf_scaled)+2) * (1.96 / sqrt(288)), 'Color', 'red', 'LineStyle', '--', 'HandleVisibility', 'off');
plot(0:length(pacf_scaled)+1, ones(1, length(pacf_scaled)+2) * -(1.96 / sqrt(288)), 'Color', 'red', 'LineStyle', '--', 'HandleVisibility', 'off');

fnt = 15;
% Grid and labels
grid on;
xlabel('tau');
ylabel('Amplitude');
title('Partial Autocorrelation Function');
fontsize(fnt, 'points')
legend('Interpreter', 'latex', 'FontSize', 15);
% Adjust x-axis limits
xlim([0, length(pacf_scaled) + 1]);


% Model Selection Criteria
N = length(data_scaled);
pred = zeros(N, MAX_MODEL_ORDER);
a_matrix = zeros(MAX_MODEL_ORDER+1, MAX_MODEL_ORDER);

% Compute Yule-Walker coefficients and predictions
for p=1:MAX_MODEL_ORDER
    [aryule_a, ~] = aryule(data_scaled, p);
    a_matrix(p, 1:p+1) = aryule_a;
    pred(:, p) = filter(-aryule_a, 1, data_scaled);
end

% Compute cumulative mean squared error
Ep = cumsum((pred - data_scaled) .^ 2);
CMSE = Ep(end, :);

p = 1:MAX_MODEL_ORDER;
MDL = log(CMSE) + (p + log(N)) / N;
AIC = log(CMSE) + 2*p/N;
AICc = AIC + (2 * p .* (p + 1)) ./ (N - p - 1);

% Plot Model Selection Criteria
figure;
hold on;
linewidth = 1;
fontsize = 16;

h1 = plot(1:MAX_MODEL_ORDER, MDL, 'b-', 'DisplayName', 'MDL', 'LineWidth', linewidth);
h2 = plot(1:MAX_MODEL_ORDER, AIC, 'r-', 'DisplayName', 'AIC', 'LineWidth', linewidth);
h3 = plot(1:MAX_MODEL_ORDER, AICc, 'm-', 'DisplayName', 'AICc', 'LineWidth', linewidth);
h4 = plot(1:MAX_MODEL_ORDER, log(CMSE), 'y', 'DisplayName', 'Cumulative Squared Error', 'LineWidth', linewidth);

scatter(1:MAX_MODEL_ORDER, MDL, 'b');
scatter(1:MAX_MODEL_ORDER, AIC, 'r');
scatter(1:MAX_MODEL_ORDER, AICc, 'm');
scatter(1:MAX_MODEL_ORDER, log(CMSE), 'y');

xlim([1,MAX_MODEL_ORDER]);
xticks(1:MAX_MODEL_ORDER);
title('Model Selection Criteria', 'FontSize', fontsize);
xlabel('Model Order', 'FontSize', fontsize);
ylabel('Criterion Value', 'FontSize', fontsize);
legend([h1, h2, h3, h4], 'FontSize', fontsize);
grid on;
hold off;


%% Question 1c) i.
% Clear workspace and figures
clear all
close all
clc

% Define range of sample sizes and variance values for analysis
sampleSizes = 51:50:1001;
varianceValues = 51:50:1001;

% Load NASDAQ stock data
load NASDAQ.mat
stockPrices = NASDAQ.Close;

% Calculate autocorrelation of normalized stock prices
normalizedPrices = zscore(stockPrices);
autocorrelation = xcorr(normalizedPrices, 'unbiased');

% Create meshgrid for visualization
[sampleSizeMesh, varianceMesh] = meshgrid(sampleSizes, varianceValues);

% Calculate Cramer-Rao Lower Bounds (CRLB)
% CRLB for variance estimation
crlb_variance = 2 * (varianceMesh.^2) ./ sampleSizeMesh;

% CRLB for parameter a1 estimation
% Note: 924 appears to be a specific lag in the autocorrelation
crlb_parameter = varianceMesh ./ (sampleSizeMesh * autocorrelation(924));

% Create a single figure with two subplots
figure('Position', [100, 100, 1000, 500])  % Set larger figure size for better visualization

% Subplot 1: Heatmap for CRLB of variance estimation
subplot(1, 2, 1)
heatmap_variance = heatmap(sampleSizes, varianceValues, crlb_variance);
heatmap_variance.Colormap = parula;
heatmap_variance.ColorScaling = 'log';
title('CRLB for Variance Estimation')
xlabel('Sample Size (N)')
ylabel('Variance Value')

% Subplot 2: Heatmap for CRLB of parameter a1 estimation
subplot(1, 2, 2)
heatmap_parameter = heatmap(sampleSizes, varianceValues, crlb_parameter);
heatmap_parameter.Colormap = parula;
heatmap_parameter.ColorScaling = 'log';
title('CRLB for Parameter a1 Estimation')
xlabel('Sample Size (N)')
ylabel('Variance Value')

% Add a main title for the entire figure
sgtitle('Cramer-Rao Lower Bound Analysis of NASDAQ Data')



