%% Question 1
clc
clear all
close all

digitsPerNumber = 11;
% generate a random number
phone_number = [0, 2, 0, randi([0 9], 1, 8)];
% number used for analysis
phone_number = [ 0 2 0 1 8 2 1 1 0 9 2];
fsamp = 32768; % in Hz
secondsPerTone = 0.25;
samplesPerTone = int32(fsamp * secondsPerTone);
samplesPerDigit = 2 * samplesPerTone;

% Map of digits to frequencies
freq_map = containers.Map({ ...
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#' ...
}, { ...
    [697, 1209], [697, 1336], [697, 1477], [770, 1209], [770, 1336], [770, 1477], ...
    [852, 1209], [852, 1336], [852, 1477], [941, 1209], [941, 1336], [941, 1477] ...
});


% initialise sequence y
y = zeros(samplesPerDigit * digitsPerNumber, 1);
% each number pressed for 0.25s then silent for 0.25s
for i=1:length(phone_number)    
    digit = int2str(phone_number(i));
    freqOfTone = freq_map(digit);
    f1 = freqOfTone(1);
    f2 = freqOfTone(2);
    
    startIndex = 1 + samplesPerDigit * (i-1);
    endIndex = samplesPerTone + samplesPerDigit * (i-1);
    n = double(startIndex:endIndex);
    y(n) = sin(2*pi*f1 * (n-1)/fsamp) + sin(2*pi*f2 * (n-1)/fsamp);
    
end


t = (0:length(y)-1)/fsamp;
alpha = 0.1; % only plot part of the tone
Tone1 = 1:samplesPerTone * alpha;
Tone2 = samplesPerDigit+1: samplesPerDigit+samplesPerTone * alpha; 

figure;

% Subplot 1: Full DTMF Signal
subplot(3, 1, 1);
plot(t, y);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('DTMF Signal');
xlim([-0.1, 5.6]);

% Subplot 2: Tone 1
subplot(3, 1, 2);
plot(t(Tone1), y(Tone1));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tone 1');

% Subplot 3: Tone 2
subplot(3, 1, 3);
plot(t(Tone2), y(Tone2));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tone 2');

%% Question 2

N = length(y);
overlap = 0;

figure;

% Subplot 1: Spectrogram
subplot(1, 2, 1);
spectrogram(y, hann(samplesPerTone), overlap, N, 'yaxis');
ylim([0 0.15]);
title('Spectrogram for the dial tone signal');

% Subplot 2: FFT of Tone 3 and Tone 4
subplot(1, 2, 2);
Tone3 = abs(s(:, 3*2-1));
Tone4 = abs(s(:, 4*2-1)); 
hold on;
plot(f, mag2db(Tone3), 'LineWidth', 2);
plot(f, mag2db(Tone4), 'LineWidth', 2);
xlim([0 0.5]);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Magnitude (dB)', 'FontSize', 14);
title('FFT of Tone 3 and Tone 4', 'FontSize', 16);
legend('Tone 3', 'Tone 4', 'FontSize', 12);
grid on;
hold off;

% % % N = length(y);
% % % overlap = 0;
% % % figure;
% % % spectrogram(y,hann(samplesPerTone), overlap,N,'yaxis');
% % % ylim([0 0.15])
% % % title('Spectrogram for the dial tone signal')
% % % 
% % % 
% % % [s, f, t] = spectrogram(y,hann(samplesPerTone), overlap,N,'yaxis');
% % % % plot the FFT of Tone 3 (number 0) and Tone 4 (number 1)
% % % Tone3 = abs(s(:, 3*2-1));
% % % Tone4 = abs(s(:, 4*2-1)); 
% % % 
% % % figure;
% % % hold on;
% % % plot(f, mag2db(Tone3), 'LineWidth', 2); % Increased LineWidth
% % % plot(f, mag2db(Tone4), 'LineWidth', 2); % Increased LineWidth
% % % xlim([0 0.5]);
% % % xlabel('Normalized Frequency', 'FontSize', 14); % Increased FontSize
% % % ylabel('Magnitude (dB)', 'FontSize', 14); % Increased FontSize
% % % title('FFT of Tone 3 and Tone 4', 'FontSize', 16); % Increased FontSize
% % % legend('Tone 3', 'Tone 4', 'FontSize', 12); % Increased FontSize
% % % grid on;
% % % hold off;
N = length(y);
overlap = 0;

figure;

% Subplot 1: Spectrogram
subplot(1, 2, 1);
spectrogram(y, hann(samplesPerTone), overlap, N, 'yaxis');
ylim([0 0.15]);
title('Spectrogram for the dial tone signal');

% Subplot 2: FFT of Number 0 and Number 1
subplot(1, 2, 2);
Tone3 = abs(s(:, 3*2-1));
Tone4 = abs(s(:, 4*2-1)); 
hold on;
plot(f, mag2db(Tone3), 'LineWidth', 2);
plot(f, mag2db(Tone4), 'LineWidth', 2);
xlim([0 0.5]);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Magnitude (dB)', 'FontSize', 14);
title('FFT of Number 0 and Number 1', 'FontSize', 16);
legend('Number 0', 'Number 1', 'FontSize', 12);
grid on;
hold off;

%% Question 4

% add noise to y to get z
var = 1;
z = y + randn(size(y)) * sqrt(var);



t = (0:length(z)-1)/fsamp;
alpha = 0.1; % only plot part of the tone
Tone1 = 1:samplesPerTone * alpha;
Tone2 = samplesPerDigit+1: samplesPerDigit+samplesPerTone * alpha; 

figure;

% Subplot 1: Full DTMF Signal
subplot(3, 1, 1);
plot(t, z);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('DTMF Signal');
xlim([-0.1, 5.6]);

% Subplot 2: Tone 1
subplot(3, 1, 2);
plot(t(Tone1), z(Tone1));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tone 1');

% Subplot 3: Tone 2
subplot(3, 1, 3);
plot(t(Tone2), z(Tone2));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Tone 2');

% plotting spectogram and PSD
N = length(z);
overlap = 0;
figure;
spectrogram(z,hann(samplesPerTone), overlap,N,'yaxis');
ylim([0 0.15])
title('Spectrogram for the dial tone signal')


[s, f, t] = spectrogram(z,hann(samplesPerTone), overlap,N,'yaxis');
% plot the FFT of Tone 3 (number 0) and Tone 4 (number 1)
Tone3 = abs(s(:, 3*2-1));
Tone4 = abs(s(:, 4*2-1)); 

figure;
hold on;
plot(f, mag2db(Tone3), 'LineWidth', 2); % Increased LineWidth
plot(f, mag2db(Tone4), 'LineWidth', 2); % Increased LineWidth
xlim([0 0.5]);
xlabel('Normalized Frequency', 'FontSize', 14); % Increased FontSize
ylabel('Magnitude (dB)', 'FontSize', 14); % Increased FontSize
title('FFT of Tone 3 and Tone 4', 'FontSize', 16); % Increased FontSize
legend('Tone 3', 'Tone 4', 'FontSize', 12); % Increased FontSize
grid on;
hold off;

%%

% Noise variances
variances = [0.05, 1, 5];

% Create a single figure for all plots
figure;

for i = 1:length(variances)
    var = variances(i);

    % Add noise to y to get z
    z = y + randn(size(y)) * sqrt(var);
    t = (0:length(z)-1)/fsamp;
    alpha = 0.1; % only plot part of the tone
    Tone1 = 1:samplesPerTone * alpha;
    Tone2 = samplesPerDigit+1: samplesPerDigit+samplesPerTone * alpha; 
    
    % --- Row 1: Tone 1 Plot ---
    subplot(3, length(variances), i); % 3 rows, num_vars columns, current plot index
    plot(t(Tone1), z(Tone1));
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    title(['Tone 1 (var = ', num2str(var), ')']);

    % --- Row 2: Spectrogram Plot ---
    N = length(z);
    overlap = 0;
    subplot(3, length(variances), length(variances) + i); % 3 rows, num_vars columns, current plot index
    spectrogram(z, hann(samplesPerTone), overlap, N, 'yaxis');
    ylim([0 0.15]);
    title(['Spectrogram (var = ', num2str(var), ')']);
    xlabel('Time (seconds)');
    ylabel('Frequency (normalized)');
   

    % --- Row 3: FFT Plot ---
    [s, f, ~] = spectrogram(z, hann(samplesPerTone), overlap, N, 'yaxis');
    Tone3 = abs(s(:, 3*2-1));
    Tone4 = abs(s(:, 4*2-1)); 
    subplot(3, length(variances), 2 * length(variances) + i); % 3 rows, num_vars columns, current plot index
    hold on;
    plot(f, mag2db(Tone3), 'LineWidth', 2);
    plot(f, mag2db(Tone4), 'LineWidth', 2);
    xlim([0 0.5]);
    xlabel('Normalized Frequency', 'FontSize', 14);
    ylabel('Magnitude (dB)', 'FontSize', 14);
    title(['FFT (var = ', num2str(var), ')'], 'FontSize', 16);
    legend('Digit 0', 'Digit 1', 'FontSize', 12);
    grid on;
    hold off;
end