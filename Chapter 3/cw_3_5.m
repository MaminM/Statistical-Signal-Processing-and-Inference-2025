close all
clear all
clc

load 'Chapter 3'\Part3_5.mat

%remove the trend in the signal
rr1d = detrend(RRI_trial1);
rr2d = detrend(RRI_trial2);
rr3d = detrend(RRI_trial3);
% rr1d = rr1d(1:400);
% rr2d = rr2d(1:400);
% rr3d = rr3d(1:400);

figure;
%use periodogram function form Ex3_0
subplot(3,3,1)
PSD1 = pgm(rr1d');
N = length(rr1d');
freq1 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq1,PSD1(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 1');
grid on;
xlim([0 0.5]); % Added xlim

subplot(3,3,2)
PSD2 = pgm(rr2d');
N = length(rr2d');
freq2 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq2,PSD2(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 2');
grid on;
xlim([0 0.5]); % Added xlim

subplot(3,3,3)
PSD3 = pgm(rr3d');
N = length(rr3d');
freq3 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq3,PSD3(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 3');
grid on;
xlim([0 0.5]); % Added xlim

% Average periodogram, window length 50
windowLength = 50;
numWindows = int32(1000/50);
% trial 1
buff1 = reshape(rr1d, numWindows, []);
avg_psd1 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd1(i, :) = pgm(buff1(i, :)');
end
f_avg1 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg1 = mean(avg_psd1);
subplot(3, 3, 4);
plot(f_avg1, avg1(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 1, L=50');
xlim([0 0.5]); % Added xlim

% trial 2
buff2 = reshape(rr2d, numWindows, []);
avg_psd2 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd2(i, :) = pgm(buff2(i, :)');
end
f_avg2 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg2 = mean(avg_psd2);
subplot(3, 3, 5);
plot(f_avg2, avg2(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 2, L=50');
xlim([0 0.5]); % Added xlim

% trial 3
buff3 = reshape(rr3d, numWindows, []);
avg_psd3 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd3(i, :) = pgm(buff3(i, :)');
end
f_avg3 =  (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg3 = mean(avg_psd3);
subplot(3, 3, 6);
plot(f_avg3, avg3(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 3, L=50');
xlim([0 0.5]); % Added xlim

% Average periodogram, window length 100
windowLength = 100;
numWindows = int32(1000/100);
buff4 = reshape(rr1d, numWindows, []);
avg_psd4 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd4(i, :) = pgm(buff4(i, :)');
end
f_avg4 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg4 = mean(avg_psd4);
subplot(3, 3, 7);
plot(f_avg4, avg4(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 1, L=150');
xlim([0 0.5]); % Added xlim

% trial 2
buff5 = reshape(rr2d, numWindows, []);
avg_psd5 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd5(i, :) = pgm(buff5(i, :)');
end
f_avg5 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg5 = mean(avg_psd5);
subplot(3, 3, 8);
plot(f_avg5, avg5(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 2, L=150');
xlim([0 0.5]); % Added xlim

% trial 3
buff6 = reshape(rr3d, numWindows, []);
avg_psd6 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd6(i, :) = pgm(buff6(i, :)');
end
f_avg6 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg6 = mean(avg_psd6);
subplot(3, 3, 9);
plot(f_avg6, avg6(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 3, L=150');
xlim([0 0.5]); % Added xlim

%% GRID ON GRID MINOR

% close all
% clear all
% clc
load 'Chapter 2'\ECG.mat
%remove the trend in the signal
rr1d = detrend(RRI_trial1);
rr2d = detrend(RRI_trial2);
rr3d = detrend(RRI_trial3);
figure;
%use periodogram function form Ex3_0
subplot(3,3,1)
PSD1 = pgm(rr1d');
N = length(rr1d');
freq1 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq1,PSD1(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 1');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
subplot(3,3,2)
PSD2 = pgm(rr2d');
N = length(rr2d');
freq2 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq2,PSD2(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 2');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
subplot(3,3,3)
PSD3 = pgm(rr3d');
N = length(rr3d');
freq3 = (0:N/2) / N; % Normalized frequency vector, 0 to 0.5
plot(freq3,PSD3(1:N/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram, Trial 3');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% Average periodogram, window length 50
rr1d = rr1d(1:400);
rr2d = rr2d(1:400);
rr3d = rr3d(1:400);
windowLength = 50;
numWindows = 8;
% trial 1
buff1 = reshape(rr1d, numWindows, []);
avg_psd1 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd1(i, :) = pgm(buff1(i, :)');
end
f_avg1 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg1 = mean(avg_psd1);
subplot(3, 3, 4);
plot(f_avg1, avg1(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 1, L=50');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% trial 2
buff2 = reshape(rr2d, numWindows, []);
avg_psd2 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd2(i, :) = pgm(buff2(i, :)');
end
f_avg2 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg2 = mean(avg_psd2);
subplot(3, 3, 5);
plot(f_avg2, avg2(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 2, L=50');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% trial 3
buff3 = reshape(rr3d, numWindows, []);
avg_psd3 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd3(i, :) = pgm(buff3(i, :)');
end
f_avg3 =  (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg3 = mean(avg_psd3);
subplot(3, 3, 6);
plot(f_avg3, avg3(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 3, L=50');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% Average periodogram, window length 100
windowLength = 100;
numWindows = 4;
buff4 = reshape(rr1d, numWindows, []);
avg_psd4 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd4(i, :) = pgm(buff4(i, :)');
end
f_avg4 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg4 = mean(avg_psd4);
subplot(3, 3, 7);
plot(f_avg4, avg4(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 1, L=150');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% trial 2
buff5 = reshape(rr2d, numWindows, []);
avg_psd5 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd5(i, :) = pgm(buff5(i, :)');
end
f_avg5 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg5 = mean(avg_psd5);
subplot(3, 3, 8);
plot(f_avg5, avg5(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 2, L=150');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);
% trial 3
buff6 = reshape(rr3d, numWindows, []);
avg_psd6 = zeros(numWindows, windowLength);
for i = 1:numWindows
    avg_psd6(i, :) = pgm(buff6(i, :)');
end
f_avg6 = (0:windowLength/2) / windowLength; % Normalized frequency vector, 0 to 0.5
avg6 = mean(avg_psd6);
subplot(3, 3, 9);
plot(f_avg6, avg6(1:windowLength/2+1)); % Plot only the first half
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Avg PSD, Trial 3, L=150');
grid on;
grid minor; % added grid minor
xlim([0 0.5]);