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


%% Question 2
clc
clear all
close all

% 8 segments of 128 samples - 1024 in total
x = randn(128, 8);
pxfs = zeros(128, 8);

for i=1:8
    pxfs(:,i) = pgm(x(:, i));
end



figure;
for i = 1:8
    subplot(2, 4, i); % 2 rows, 4 columns, plot i
    plot((1:128)/128, pxfs(:, i)); % Plot each column with normalized frequency
    title(['Segment ', num2str(i)]);
    xlabel('Normalized Frequency');
    ylabel('PSD');
    grid on;
    grid minor;
end

%% Question 3
clc
clear all
close all

% 8 segments of 128 samples - 1024 in total
samples1 = 128;
seg1 = 8;
x1 = randn(samples1, seg1);
pxfs1 = zeros(samples1, seg1);
for i = 1:seg1
    pxfs1(:, i) = pgm(x1(:, i));
end
averaged_pxf1 = mean(pxfs1, 2);

% 32 segments of 32 samples - 1024 in total
samples2 = 32;
seg2 = 32;
x2 = randn(samples2, seg2);
pxfs2 = zeros(samples2, seg2);
for i = 1:seg2
    pxfs2(:, i) = pgm(x2(:, i));
end
averaged_pxf2 = mean(pxfs2, 2);

% 256 segments, 32768 samples
samples3 = 128;
seg3 = 256;
x3 = randn(samples3, seg3);
pxfs3 = zeros(samples3, seg3);
for i = 1:seg3
    pxfs3(:, i) = pgm(x3(:, i));
end
averaged_pxf3 = mean(pxfs3, 2);

% Create a figure with three horizontal subplots
figure;

% Subplot 1: 8 segments, 128 samples
subplot(1, 3, 1);
stem((1:samples1) / samples1, averaged_pxf1);
xlabel('Normalized Frequency');
ylabel('PSD');
title('Averaged PSD (8 segments, 128 samples)');
grid on;
grid minor;

% Subplot 2: 32 segments, 32 samples
subplot(1, 3, 2);
stem((1:samples2) / samples2, averaged_pxf2);
xlabel('Normalized Frequency');
ylabel('PSD');
title('Averaged PSD (32 segments, 32 samples)');
grid on;
grid minor;

% Subplot 3: 256 segments, 128 samples
subplot(1, 3, 3);
stem((1:samples3) / samples3, averaged_pxf3);
xlabel('Normalized Frequency');
ylabel('PSD');
title('Averaged PSD (256 segments, 128 samples)');
grid on;
grid minor;

