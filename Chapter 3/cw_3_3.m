%% Question 3
close all; clear all; clc;
load('sunspot.dat')
sunspotdata = sunspot(:, 2);
data = sunspotdata - mean(sunspotdata);

m2 = ar(data,2,'ls');
%apply LSE approach on sunspot series
for order = 1:10
    model = ar(data, order, 'ls');
    fprintf('AR coefficients for order %d:\n', order);
    disp(model.a);
    fprintf('\n');
end

%% Question 4
MSE = [];
%approximation error against model order 
%find optimum mode order
for i = 1:10
    m = ar(data,i,'ls'); 
    y = compare(data,m,1);
    error = sum((y-data).^2)/288;
    MSE = [MSE error];
end
plot([1:10],MSE,'k', 'LineWidth',2);
xlabel('model order')
ylabel('Approximation error(MSE)')
title('Approximation error for different model order')
grid
%% Question 5
close all
clear all
clc

load('sunspot.dat')
sunspotdata = sunspot(:, 2);
data = sunspotdata - mean(sunspotdata);

% find AR(2) fit
m2 = ar(data,2,'ls');

% AR(2) PSD Comparison
a = m2.A; N = 1024;
PSD_th = abs(freqz(1, a, N, 1)).^2; 
f = (1:N) / N;

figure;
plot(f / 2, 20 * log10(PSD_th), 'LineWidth', 2);
% generate filtered white noise
w = randn(N, 1, 1); y = filter(1, a, w);
% plot PSD
[Pxx_yw, F_yw] = pyulear(y, 2, 1024, 1);
hold on; plot(F_yw, 20 * log10(Pxx_yw),'r', 'LineWidth', 2);
xlabel('Normalized Frequency (Hz)'); ylabel('PSD (dB/Hz)');
legend('LSE PSD', 'pyulear PSD'); xlim([0 0.5]); title('AR(2) PSD'); grid;


%% Question 6
close all
clear all
clc

load('sunspot.dat')
sunspotdata = sunspot(:, 2);
data = sunspotdata - mean(sunspotdata);

% find AR(2) fit
m2 = ar(data,2,'ls');

MSE = [];
for N = 10:5:250
    temp = data(1:N);
    m2 = ar(temp,2,'ls'); 
    y = compare(temp,m2,1);
    error = sum((y-temp).^2)/N;
    MSE = [MSE error];
end
plot([10:5:250],MSE, 'k' , 'LineWidth',2);
xlabel('Data length')
ylabel('Approximation error(MSE)')
title('Approximation error for AR(2)')
grid

