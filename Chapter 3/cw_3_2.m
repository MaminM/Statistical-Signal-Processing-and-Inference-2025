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

% removing first 40 samples
y = y(41:end);

% Calculate frequency response
[h, w] = freqz([1], [1 0.9], 512);clear all; close all; clc;

%Part 3.2.1
x = randn(1064,1);
y = filter((1),[1 0.9],x);
figure
[acor, lag] = xcorr(y, 'unbiased');
stem(lag,acor);
xlim([0 20]);
title('ACF of AR(1) process')
xlabel('lag');
ylabel('Correlation');

%remove first 40 samples 
y = y(41:end);

figure;
[h,w]= freqz((1),[1 0.9],512);
subplot(1,2,1)

PSD=pgm(y);
plot(w/(2*pi), PSD(1:512),'r')
hold on
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0 0.5 0 250]);
title('Periodogram and PSD for filtered WGN')
xlabel('Normalised Frequency');
ylabel('PSD');
legend('Estimated PSD', 'Theoretical PSD', 'Location', 'NorthWest');
grid
hold off

subplot(1,2,2)
PSD=pgm(y);
plot(w/(2*pi), PSD(1:512),'r');
hold on
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0.4 0.5 0 250]);
title('Periodogram and PSD for filtered WGN zoomed')
xlabel('Normalised Frequency');
ylabel('PSD');
legend('Estimated PSD', 'Theoretical PSD', 'Location', 'NorthWest');
grid 
hold off


%Apply a hamming window
figure;
ham = hamming(1024);
New = conv(ham,PSD);
hold on
plot(w/(2*pi),New(1:512), 'r');
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
title('periodogram after Hamming window');
xlabel('Normalised Frequency');
ylabel('PSD');
hold off

%3.2.4

% autocorrelation series
R = xcorr(y, 'unbiased');

% These are the two equations we need to work out our filter coefficients
% based on the sampele size, 1025 and 1024 are the right lag indexes
% because we only deal with 512 samples
a1 = -R(1025)/R(1024);
var1 = R(1024) + a1*R(1025);

exact = freqz(var1, [1, a1], 512);

% and plot model based frequency response and exact response  
figure;
hold on
plot(w/(2*pi), abs(exact).^2, 'k', w/(2*pi), abs(h).^2, 'b', 'LineWidth', 2 )
plot(w/(2*pi), PSD(1:512),'r');
    grid on
    title('PSD from different methods')
    xlabel('Normalised Frequency');
    ylabel('PSD (Magnitude)');
    legend('model based PSD', 'theoretical PSD', 'periodogram', 'Location', 'NorthWest');
    axis([0.4 0.5 0 250]);
hold off

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


%% Question 4

R = xcorr(y, 'unbiased');

% These are the two equations we need to work out our filter coefficients
% based on the sampele size, 1025 and 1024 are the right lag indexes
% because we only deal with 512 samples
a1 = -R(1025)/R(1024);
var1 = R(1024) + a1*R(1025);

exact = freqz(var1, [1, a1], 512);

% and plot model based frequency response and exact response  
figure;
hold on
plot(w/(2*pi), abs(exact).^2, 'm', w/(2*pi), abs(h).^2, 'b', 'LineWidth', 2 )
plot(w/(2*pi), PSD(1:512),'r');
    grid on
    title('PSD from different methods')
    xlabel('Normalised Frequency');
    ylabel('PSD (Magnitude)');
    legend('model based PSD', 'theoretical PSD', 'periodogram', 'Location', 'NorthWest');
    axis([0.4 0.5 0 250]);
hold off


%% Question 5
close all
clear
clc


load('sunspot.dat')
sunspotdata = sunspot(:, 2);
% Create the zero mean version of the data
zero_mean_ss = sunspotdata - mean(sunspotdata);

% Take the periodogram of our sunspot data
ped = pgm(sunspotdata);
% periodogram fior zero mean sunspot data
normped = pgm(zero_mean_ss); 

% Subplot indexing
k = 1;
% Model Orders to test
for i = [ 2, 5, 10 ] 
   
    % find psd by Yule-Walker equations
	[pxx, w] = pyulear(sunspotdata, i, 288);
    [pxx1, w1] = pyulear(zero_mean_ss, i, 288);
    subplot(2,3,k)
        hold on;
        plot(w/(2*pi), ped(1:145), 'r');
        plot(w/(2*pi), pxx, 'b', 'LineWidth', 2);
        hold off;
        xlim([0 0.25]); % Set this limit to view the area of interest
        xlabel('Normalised Frequency');
        ylabel('PSD (Magnitude)');
        t = sprintf('Sunspot estimation for AR(%i) process',i);
        title(t);
        legend('Sunspot Periodogram', 'Model based PSD')
        grid on;

    % Plot zero mean version 
    subplot(2,3,k+3)
        hold on;
        plot(w1/(2*pi), normped(1:145), 'r');
        plot(w1/(2*pi), abs(pxx1), 'b', 'LineWidth', 2); % Theoretical PSD
        hold off;
        xlim([0 0.25]);
        xlabel('Normalised Frequency');
        ylabel('PSD (Magnitude)');
        t = sprintf('Zero Mean sunspot estimation for AR(%i) process',i);
        title(t);
        legend('Sunspot Periodogram', 'Model based PSD')
        grid on;
        
        %Error function for periodogram
        error = abs(normped(1:145)- pxx);
        error = error.^2;
        MSE(i) = sum(error)/145;
        
    k = k + 1;
end

