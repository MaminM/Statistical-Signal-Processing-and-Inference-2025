%% Part a. and b.
clc
clear all
close all

load 'Chapter 2'\ECG.mat

rr = RRI_trial1;
heart_rate = 60 ./ rr;


L = int32(length(heart_rate)/10)-1;
smooth_heart_rate = zeros(L, 1);
alpha = 1;
for i=1:L
    smooth_heart_rate(i) = (alpha/10) * sum(heart_rate(10*i-9:10*i));
end

smooth_heart_rate_2 = zeros(L, 1);
alpha = 0.6;
for i=1:L
    smooth_heart_rate_2(i) = (alpha/10)* sum(heart_rate(10*i-9:10*i));
end

% Create a figure with subplots
figure;
NumBins = 25;
% Top subplot: heart_rate
subplot(3, 1, 1); % 3 rows, 1 column, first subplot
histogram(heart_rate, 'Normalization', 'probability', 'NumBins', NumBins); % Added 'NumBins'
title('Heart Rate');
xlabel('Sample');
ylabel('Probability');
grid on;
xlim([20, 120]);

% Middle subplot: smooth_heart_rate (alpha = 1)
subplot(3, 1, 2); % 3 rows, 1 column, second subplot
histogram(smooth_heart_rate, 'Normalization', 'probability', 'NumBins', NumBins); % Added 'NumBins'
title('Smooth Heart Rate (alpha = 1)');
xlabel('Heart Rate');
ylabel('Probability');
grid on;
xlim([20, 120]);

% Bottom subplot: smooth_heart_rate_2 (alpha = 0.6)
subplot(3, 1, 3); % 3 rows, 1 column, third subplot
histogram(smooth_heart_rate_2, 'Normalization', 'probability', 'NumBins', NumBins); % Added 'NumBins'
title('Smooth Heart Rate (alpha = 0.6)');
xlabel('Heart Rate');
ylabel('Probability');
grid on;
xlim([20, 120]);

%% Part c. 
clc
clear all
close all

load 'Chapter 2'\ECG.mat



rr1 = detrend(RRI_trial1);
rr1_acf = xcorr(rr1, 'unbiased');
l = int32( (length(rr1_acf) - 1) / 2 );
tau1 = (-l:l);

rr2 = detrend(RRI_trial2);
rr2_acf = xcorr(rr2, 'unbiased');
l = int32( (length(rr2_acf) - 1) / 2 );
tau2 = (-l:l);

rr3 = detrend(RRI_trial3);
rr3_acf = xcorr(rr3, 'unbiased');
l = int32( (length(rr3_acf) - 1) / 2 );
tau3 = (-l:l);

% find and plot ACF

figure;
% Subplot 1: tau1, rr1_acf
subplot(1, 3, 1); % 1 row, 3 columns, first subplot
plot(tau1, rr1_acf);
ylim([-0.02, 0.02]);
title('ACF of trial 1');
xlabel('tau');
ylabel('ACF');
grid on;

% Subplot 2: tau2, rr2_acf
subplot(1, 3, 2); % 1 row, 3 columns, second subplot
plot(tau2, rr2_acf);
% ylim([-0.02, 0.02]);
title('ACF of trial 2');
xlabel('tau');
ylabel('ACF');
grid on;

% Subplot 3: tau3, rr3_acf
subplot(1, 3, 3); % 1 row, 3 columns, third subplot
plot(tau3, rr3_acf);
ylim([-0.02, 0.02]);
title('ACF of trial 3');
xlabel('tau');
ylabel('ACF');
grid on;

%% Part d. Trial 1

clc
clear all
close all

load 'Chapter 2'\ECG.mat

rr1 = detrend(RRI_trial1);
data = RRI_trial1;
data_scaled = rr1;

MAX_MODEL_ORDER = 10; 
OFFSET = (length(data_scaled) - 1)/2;

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
data_scaled_ACF = xcorr(data, 'unbiased');

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
title('Partial Autocorrelation Function | Trial 1');
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
Ep = cumsum((pred - data_scaled') .^ 2);
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
title('Model Selection Criteria | Trial 1', 'FontSize', fontsize);
xlabel('Model Order', 'FontSize', fontsize);
ylabel('Criterion Value', 'FontSize', fontsize);
legend([h1, h2, h3, h4], 'FontSize', fontsize);
grid on;
hold off;

%% Part d. Trial 2


clc
clear all
close all

load 'Chapter 2'\ECG.mat

rr2 = detrend(RRI_trial2);
data = RRI_trial2;
data_scaled = rr2;

MAX_MODEL_ORDER = 10; 
OFFSET = (length(data_scaled) - 1)/2;

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
data_scaled_ACF = xcorr(data, 'unbiased');

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
title('Partial Autocorrelation Function | Trial 2');
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
Ep = cumsum((pred - data_scaled') .^ 2);
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
title('Model Selection Criteria | Trial 2', 'FontSize', fontsize);
xlabel('Model Order', 'FontSize', fontsize);
ylabel('Criterion Value', 'FontSize', fontsize);
legend([h1, h2, h3, h4], 'FontSize', fontsize);
grid on;
hold off;


%% Part d. Trial 3

clc
clear all
close all

load 'Chapter 2'\ECG.mat

rr3 = detrend(RRI_trial3);
data = RRI_trial3;
data_scaled = rr3;

MAX_MODEL_ORDER = 10; 
OFFSET = (length(data_scaled) - 1)/2;

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
data_scaled_ACF = xcorr(data, 'unbiased');

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
title('Partial Autocorrelation Function | Trial 3');
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
Ep = cumsum((pred - data_scaled') .^ 2);
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
title('Model Selection Criteria | Trial 3', 'FontSize', fontsize);
xlabel('Model Order', 'FontSize', fontsize);
ylabel('Criterion Value', 'FontSize', fontsize);
legend([h1, h2, h3, h4], 'FontSize', fontsize);
grid on;
hold off;






