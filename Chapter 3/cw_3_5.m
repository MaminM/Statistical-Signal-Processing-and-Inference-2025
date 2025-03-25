%% Question 5
clc
clear all
close all

load 'Chapter 2'\ECG.mat

%remove the trend in the signal
%make them zero mean
rr1d = detrend(RRI_trial1);
rr2d = detrend(RRI_trial2);
rr3d = detrend(RRI_trial3);

rr1d = rr1d(1:400);
rr2d = rr2d(1:400);
rr3d = rr3d(1:400);

% Periodogram using pgm function

% --- Trail 1 ---
subplot(3, 3, 1);
PSD1 = pgm(rr1d'); % Calculate periodogram
N1 = length(rr1d'); % Length of signal
freq1 = (0:N1-1) / N1; % Normalized frequency vector
stem(freq1, PSD1); % Plot periodogram
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram of trail 1');
grid on;

% --- Trail 2 ---
subplot(3, 3, 2);
PSD2 = pgm(rr2d');
N2 = length(rr2d');
freq2 = (0:N2-1) / N2;
stem(freq2, PSD2); % Corrected: Plot PSD2, not rr2d
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram of trail 2');
grid on;

% --- Trail 3 ---
subplot(3, 3, 3);
PSD3 = pgm(rr3d');
N3 = length(rr3d');
freq3 = (0:N3-1) / N3;
stem(freq3, PSD3); % Corrected: Plot PSD3, not rr3d
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Periodogram of trail 3');
grid on;

%%
% Average periodogram
windowLength = 50;

% --- Trail 1 ---
buffer1 = reshape(rr1d, windowLength, []);
PSD1 = zeros(windowLength, size(buffer1, 2));

% Calculate PSDs for each segment
for i = 1:size(buffer1, 2)
    PSD1(:, i) = pgm(buffer1(:, i)); % Corrected: pgm(buffer(:,i))
end

N1 = windowLength;
freq1 = (0:N1-1) / N1;
Avg1 = mean(PSD1, 2); % Average along columns (frequency bins)


subplot(3, 3, 4);
stem(freq1, Avg1);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 1, 50 window length');


% --- Trail 2 ---
buffer2 = reshape(rr2d, windowLength, []);
PSD2 = zeros(windowLength, size(buffer2, 2));

for i = 1:size(buffer2, 2)
    PSD2(:, i) = pgm(buffer2(:, i)); % Corrected: pgm(buffer(:,i))
end

N2 = windowLength;
freq2 = (0:N2-1) / N2;
Avg2 = mean(PSD2, 2);

subplot(3, 3, 5);
stem(freq2, Avg2);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 2, 50 window length');

% --- Trail 3 ---
buffer3 = reshape(rr3d, windowLength, []);
PSD3 = zeros(windowLength, size(buffer3, 2));

for i = 1:size(buffer3, 2)
    PSD3(:, i) = pgm(buffer3(:, i)); % Corrected: pgm(buffer(:,i))
end

N3 = windowLength;
freq3 = (0:N3-1) / N3;
Avg3 = mean(PSD3, 2);

subplot(3, 3, 6);
stem(freq3, Avg3);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 3, 50 window length');


% Average periodogram
windowLength = 100;

% --- Trail 1 ---
buffer1 = reshape(rr1d, windowLength, []);
PSD1 = zeros(windowLength, size(buffer1, 2));

% Calculate PSDs for each segment
for i = 1:size(buffer1, 2)
    PSD1(:, i) = pgm(buffer1(:, i));
end

N1 = windowLength;
freq1 = (0:N1-1) / N1;
Avg1 = mean(PSD1, 2);

subplot(3, 3, 7); % Change subplot location to the last row
stem(freq1, Avg1);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 1, 100 window length'); % Update title

% --- Trail 2 ---
buffer2 = reshape(rr2d, windowLength, []);
PSD2 = zeros(windowLength, size(buffer2, 2));

for i = 1:size(buffer2, 2)
    PSD2(:, i) = pgm(buffer2(:, i));
end

N2 = windowLength;
freq2 = (0:N2-1) / N2;
Avg2 = mean(PSD2, 2);

subplot(3, 3, 8); % Change subplot location to the last row
stem(freq2, Avg2);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 2, 100 window length'); % Update title

% --- Trail 3 ---
buffer3 = reshape(rr3d, windowLength, []);
PSD3 = zeros(windowLength, size(buffer3, 2));

for i = 1:size(buffer3, 2)
    PSD3(:, i) = pgm(buffer3(:, i));
end

N3 = windowLength;
freq3 = (0:N3-1) / N3;
Avg3 = mean(PSD3, 2);

subplot(3, 3, 9); % Change subplot location to the last row
stem(freq3, Avg3);
xlabel('Normalized frequency');
ylabel('Estimated PSD');
title('Average periodogram trail 3, 100 window length'); % Update title