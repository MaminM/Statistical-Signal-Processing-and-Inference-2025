clc
clear all
close all
% pgm

% first write the script
% then make it a function
% Input vector x and plot for N = 128
N1 = 128;
n1 = 1:N1;
x1 = randn(N1, 1);
pxf1 = pgm(x1);

% Input vector x and plot for N = 256
N2 = 256;
n2 = 1:N2;
x2 = randn(N2, 1);
pxf2 = pgm(x2);

% Input vector x and plot for N = 512
N3 = 512;
n3 = 1:N3;
x3 = randn(N3, 1);
pxf3 = pgm(x3);

% Create a figure with three horizontal subplots
figure;

% Subplot 1: N = 128
subplot(1, 3, 1);
stem(n1/N1, pxf1);
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=128');
grid on;
grid minor;

% Subplot 2: N = 256
subplot(1, 3, 2);
stem(n2/N2, pxf2);
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=256');
grid on;
grid minor;

% Subplot 3: N = 512
subplot(1, 3, 3);
stem(n3/N3, pxf3);
xlabel('Normalised Frequency');
ylabel('PSD');
title('PSD for WGN with N=512');
grid on;
grid minor;
