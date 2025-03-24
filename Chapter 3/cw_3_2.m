%% Question 1
clc
clear all
close all

% create 1064 sample WGN 
L = 1064;
x = randn(L, 1);

% filter
b = 1;
a = [1, 0.9];
y = filter(b, a, x);

% Calculate frequency response
[h, w] = freqz([1], [1 0.9], 512);

% Plot the magnitude squared of the frequency response
figure;
plot(w / (2 * pi), abs(h).^2);

% Add axis labels and title
xlabel('Normalized Frequency (cycles/sample)');
ylabel('|H(f)|^2 (Magnitude Squared)');
title('Frequency Response of Filter: H(z) = 1 / (1 - 0.9z^{-1})');

% Optional: Add grid lines for better readability
grid on;

% Question 2

% now estimate the psd with periodogram
y_pgm = pgm(y);

% Plot the magnitude squared of the frequency response
figure;
hold on
plot(w / (2 * pi), abs(h).^2, 'LineWidth', 2);
plot((1:length(y_pgm)/2)/length(y_pgm), y_pgm(1:length(y_pgm)/2));
% Add axis labels and title
xlabel('Normalized Frequency (cycles/sample)');
ylabel('|H(f)|^2 (Magnitude Squared)');
title('Frequency Response of Filter: H(z) = 1 / (1 - 0.9z^{-1})');
legend('Theoretical', 'Periodogram')
% Optional: Add grid lines for better readability
grid on;
ylim([0, 130])

%% Question 3 - Zoom in !
% Plot the magnitude squared of the frequency response and periodogram
figure;

% Font sizes
titleFontSize = 14;
axisFontSize = 12;
legendFontSize = 16; % Increased legend font size

% Subplot 1: Frequency Response Only
subplot(1, 3, 1); % 1 row, 3 columns, first plot
plot(w / (2 * pi), abs(h).^2);
xlabel('Normalized Frequency (cycles/sample)', 'FontSize', axisFontSize);
ylabel('|H(f)|^2 (Magnitude Squared)', 'FontSize', axisFontSize);
title('Frequency Response of Filter', 'FontSize', titleFontSize);
grid on;
legend('Ideal', 'FontSize', legendFontSize); % Added legend

% Subplot 2: Full Range with Periodogram
subplot(1, 3, 2); % 1 row, 3 columns, second plot
hold on;
plot(w / (2 * pi), abs(h).^2, 'LineWidth', 2);
plot((1:length(y_pgm) / 2) / length(y_pgm), y_pgm(1:length(y_pgm) / 2));
xlabel('Normalized Frequency (cycles/sample)', 'FontSize', axisFontSize);
ylabel('|H(f)|^2 (Magnitude Squared)', 'FontSize', axisFontSize);
title('Frequency Response vs. Periodogram', 'FontSize', titleFontSize);
legend('Ideal', 'Periodogram', 'FontSize', legendFontSize);
grid on;
ylim([0, 130]);
hold off;

% Subplot 3: Zoomed In with Periodogram
subplot(1, 3, 3); % 1 row, 3 columns, third plot
hold on;
plot(w / (2 * pi), abs(h).^2, 'LineWidth', 2);
plot((1:length(y_pgm) / 2) / length(y_pgm), y_pgm(1:length(y_pgm) / 2));
xlabel('Normalized Frequency (cycles/sample)', 'FontSize', axisFontSize);
ylabel('|H(f)|^2 (Magnitude Squared)', 'FontSize', axisFontSize);
title('Zoomed-in Frequency Response vs. Periodogram', 'FontSize', titleFontSize);
legend('Ideal', 'Periodogram', 'FontSize', legendFontSize);
grid on;
xlim([0.4, 0.5]);
hold off;