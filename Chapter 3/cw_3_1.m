%% Question 1
clc
clear all
close all

% smooth with FIR filter 0.2*[1 1 1 1 1]
windowSize = 5; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;


% Input vector x and plot for N = 128
N1 = 128;
n1 = 1:N1;
x1 = randn(N1, 1);
pxf1 = pgm(x1);
pxf1_smooth = filter(b, a, pxf1);


% Input vector x and plot for N = 256
N2 = 256;
n2 = 1:N2;
x2 = randn(N2, 1);
pxf2 = pgm(x2);
pxf2_smooth = filter(b, a, pxf2);


% Input vector x and plot for N = 512
N3 = 512;
n3 = 1:N3;
x3 = randn(N3, 1);
pxf3 = pgm(x3);
pxf3_smooth = filter(b, a, pxf3);


% Create a figure with three horizontal subplots
figure;

% Subplot 1: N = 128
subplot(1, 3, 1);
hold on
plot(n1/N1, pxf1);
plot(n1/N1, pxf1_smooth, 'LineWidth', 2)
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=128');
grid on;
grid minor;
legend('Original PSD', 'Smoothed PSD')

% Subplot 2: N = 256
subplot(1, 3, 2);
hold on
plot(n2/N2, pxf2);
plot(n2/N2, pxf2_smooth, 'LineWidth', 2)
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=256');
grid on;
grid minor;
legend('Original PSD', 'Smoothed PSD')

% Subplot 3: N = 512
subplot(1, 3, 3);
hold on
plot(n3/N3, pxf3);
plot(n3/N3, pxf3_smooth, 'LineWidth', 2);
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=512');
grid on;
grid minor;
legend('Original PSD', 'Smoothed PSD')


