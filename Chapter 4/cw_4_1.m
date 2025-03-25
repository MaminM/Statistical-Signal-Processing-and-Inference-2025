close all
clear all
clc

% Generate random input signal
x = randn(1, 1000);

% Define filter order and filter coefficients
filterOrder = 4;
filterCoeffs = [1 2 3 2 1];

% Filter the input signal
y = filter(filterCoeffs, 1, x);

% Normalize the filtered signal
yMean = mean(y);
yStd = std(y);
yNormalized = (y - yMean) / yStd;

% Generate additive noise
noiseStd = 0.1;
noise = noiseStd * randn(1, 1000);

% Create noisy signal
z = yNormalized + noise;

% Calculate cross-correlation between noisy signal and input
r_zx = xcorr(z, x, 'unbiased');

% Extract cross-correlation vector for Wiener filter estimation
p_zx = r_zx(1000 : 1000 + filterOrder);

% Calculate autocorrelation of input signal
r_xx = xcorr(x, 'unbiased');

% Create Toeplitz matrix from autocorrelation
R_xx = toeplitz(r_xx(1000 : 1000 + filterOrder));

% Calculate Wiener filter coefficients
w_opt = inv(R_xx) * p_zx'; % Transpose p_zx to make it a column vector

% Calculate Signal-to-Noise Ratio (SNR)
SNR = snr(yNormalized, noise);

% --- 4.1.2: Experiment with Increased Filter Order and Noise Variances ---

% Experiment with double the necessary coefficients.
p_zx_double = r_zx(1000 : 1000 + (2 * filterOrder))';
R_xx_double = toeplitz(r_xx(1000 : 1000 + (2 * filterOrder)));
double_w_opts = inv(R_xx_double) * p_zx_double;

% Vector of noise standard deviations to experiment with
noiseStdDevs = [0.1, 0.5, 0.75, 1, 5, 7.5, 10];

% Matrices to store results
snrValues = zeros(1, length(noiseStdDevs));
wienerCoeffs = zeros(length(noiseStdDevs), filterOrder + 1);

% Loop through noise standard deviations
for i = 1:length(noiseStdDevs)
    % Generate signals and noise
    x = randn(1, 1000);
    y = filter(filterCoeffs, 1, x);
    yMean = mean(y);
    yStd = std(y);
    yNormalized = (y - yMean) / yStd;
    noise = noiseStdDevs(i) * randn(1, 1000);
    z = yNormalized + noise;

    % Calculate cross-correlation and autocorrelation
    r_zx = xcorr(z, x, 'unbiased');
    p_zx = r_zx(1000 : 1000 + filterOrder)';
    r_xx = xcorr(x, 'unbiased');
    R_xx = toeplitz(r_xx(1000 : 1000 + filterOrder));

    % Calculate Wiener filter coefficients and SNR
    wienerCoeffs(i, :) = (inv(R_xx) * p_zx)'; % Transpose to match desired output shape
    snrValues(i) = snr(yNormalized, noise);
end

%% Plot Wiener coefficients vs. noise standard deviation
figure;
plot(noiseStdDevs, wienerCoeffs, 'LineWidth', 2);
xlabel('Noise Standard Deviation', 'FontSize', 14); % Increased font size
ylabel('Wiener Coefficients', 'FontSize', 14); % Increased font size
title('Wiener Coefficients vs. Noise Standard Deviation', 'FontSize', 16); % Increased font size
grid on;
% legend('0.1', '0.5', '0.75', '1', '5', '7.5', '10')
legend('\sigma_{\eta} = 0.1', '\sigma_{\eta} = 0.5', '\sigma_{\eta} = 0.75', '\sigma_{\eta} = 1', '\sigma_{\eta} = 5', '\sigma_{\eta} = 7.5', '\sigma_{\eta} = 10');

%% Plot SNR vs. noise standard deviation
figure;
plot(noiseStdDevs, snrValues, 'k', 'LineWidth', 2);
xlabel('Noise Standard Deviation', 'FontSize', 14); % Increased font size
ylabel('SNR (dB)', 'FontSize', 14); % Increased font size
title('SNR vs. Noise Standard Deviation', 'FontSize', 16); % Increased font size
grid on;

%% Question 2

clear all;
close all;
clc;

% Noise standard deviations to test (variance range [0.1, 10])
noiseSDs = [0.01, 0.1, 0.5, 1.4, 2.5, 3.1];

% Wiener filter order
filterOrder = 5;

% Preallocate arrays for results
signalSDs = zeros(1, length(noiseSDs));
wienerCoeffs = zeros(length(noiseSDs), filterOrder);
snrValues = zeros(1, length(noiseSDs));

% Calculate Wiener coefficients and SNR for each noise standard deviation
for i = 1:length(noiseSDs)
    [wienerCoeffs(i, :), snrValues(i), signalSDs(i)] = ...
        calcWiener(noiseSDs(i), filterOrder);
end

% Display results
for i = 1:length(noiseSDs)
    fprintf('Noise SD = %f\n', noiseSDs(i));
    disp(['Wiener Coeffs: ', num2str(wienerCoeffs(i, :))]);
    disp(['SNR (dB): ', num2str(snrValues(i))]);
end

% Plot SNR vs. noise standard deviation
figure;
plot(noiseSDs, snrValues);
xlabel('Noise Standard Deviation');
ylabel('SNR (dB)');
title('SNR vs. Noise Standard Deviation');
grid on;
grid minor;

% --- Function to calculate Wiener coefficients ---
function [coeffs, snr, signalSD] = calcWiener(noiseSD, order)
    sigLen = 1000;

    % Generate input signal
    inputSig = randn(sigLen, 1);

    % Filter input signal
    filteredSig = filter([1, 2, 3, 2, 1], 1, inputSig);

    % Calculate signal standard deviation
    signalSD = std(filteredSig);

    % Generate noise
    noise = noiseSD * randn(sigLen, 1);

    % Create noisy signal
    noisySig = noise + filteredSig;

    % Calculate signal and noise power
    sigPow = sum(filteredSig.^2) / sigLen;
    noisePow = sum(noise.^2) / sigLen;

    % Calculate SNR (dB)
    snr = 10 * log10(sigPow / noisePow);

    % Calculate autocorrelation of input signal
    autoCorrInput = xcorr(inputSig, 'unbiased');

    % Create Toeplitz matrix
    autoCorrMatrix = zeros(order, order);
    for i = 1:order
        autoCorrMatrix(:, i) = autoCorrInput(sigLen - i + 1 : sigLen + order - i);
    end

    % Calculate cross-correlation
    crossCorr = xcorr(noisySig, inputSig, 'unbiased');
    crossCorrVec = crossCorr(sigLen : sigLen + order - 1);

    % Calculate optimal Wiener coefficients
    coeffs = autoCorrMatrix \ crossCorrVec;
end

%% Question 3

