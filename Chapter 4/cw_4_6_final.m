
clear all
close all
clc

sd = 1;
a = [1 0.9 0.2];
b = 1;
N = 10000;
N_w = length(a);
n = sd*randn(N,1);

x = filter(b, a, n);
x = x./sqrt(sum(a.*a));
xDelayed = [0; x(1:N-1)];

figure(1);
clf; % Clear the figure before plotting

a_gain = 0.01;

% Subplot 1: Standard LMS
subplot(2, 2, 1);
[~, ~, w] = signLMS(xDelayed, x, a_gain, 3, 0);
wScaled = w .* sqrt(sum(b .* b));
plot(wScaled(1, :), 'k', 'DisplayName', 'a1');
hold on;
plot(wScaled(2, :), 'r', 'DisplayName', 'a2');
hold off;
title('Standard LMS');
xlabel('Sample');
ylabel('Coefficient');
grid on;
grid minor;
legend;

% Subplot 2: Signed Error
subplot(2, 2, 2);
[~, ~, w] = signLMS(xDelayed, x, a_gain, 3, 1);
wScaled = w .* sqrt(sum(b .* b));
plot(wScaled(1, :), 'k', 'DisplayName', 'a1');
hold on;
plot(wScaled(2, :), 'r', 'DisplayName', 'a2');
hold off;
title('Signed Error');
xlabel('Sample');
ylabel('Coefficient');
grid on;
grid minor;
legend;

% Subplot 3: Signed Regressor
subplot(2, 2, 3);
[~, ~, w] = signLMS(xDelayed, x, a_gain, 3, 2);
wScaled = w .* sqrt(sum(b .* b));
plot(wScaled(1, :), 'k', 'DisplayName', 'a1');
hold on;
plot(wScaled(2, :), 'r', 'DisplayName', 'a2');
hold off;
title('Signed Regressor');
xlabel('Sample');
ylabel('Coefficient');
grid on;
grid minor;
legend;

% Subplot 4: Sign-Sign
subplot(2, 2, 4);
[x_predict, e, w] = signLMS(xDelayed, x, a_gain, 3, 3);
wScaled = w .* sqrt(sum(b .* b));
plot(wScaled(1, :), 'k', 'DisplayName', 'a1');
hold on;
plot(wScaled(2, :), 'r', 'DisplayName', 'a2');
hold off;
title('Sign-Sign');
xlabel('Sample');
ylabel('Coefficient');
grid on;
grid minor;
legend;


% % figure(1)
% % a_gain = 0.01;
% % [~, ~, w] = signLMS(xDelayed, x, a_gain, 3, 0);
% % wScaled = w.*sqrt(sum(b.*b));
% % hold on
% % plot(wScaled(1,:), 'k')
% % plot(wScaled(2,:), 'r')
% % title('Evolution of coefficients using standard LMS');
% % xlabel('Sample')
% % ylabel('Coefficient')
% % grid on
% % grid minor
% % legend('a1','a2')
% % 
% % figure(2)
% % a_gain = 0.01;
% % [~,~,w] = signLMS(xDelayed, x, a_gain, 3, 1);
% % wScaled = w.*sqrt(sum(b.*b));
% % hold on
% % plot(wScaled(1,:), 'k')
% % plot(wScaled(2,:), 'r')
% % title('Evolution of coefficients using Signed Error');
% % xlabel('Sample')
% % ylabel('Coefficient')
% % grid on
% % grid minor
% % legend('a1','a2')
% % 
% % figure(3)
% % a_gain = 0.01;
% % [~,~,w] = signLMS(xDelayed, x, a_gain, 3, 2);
% % wScaled = w.*sqrt(sum(b.*b));
% % hold on
% % plot(wScaled(1,:), 'k')
% % plot(wScaled(2,:), 'r')
% % title('Evolution of coefficients using Signed Regressor');
% % xlabel('Sample')
% % ylabel('Coefficient')
% % grid on
% % grid minor
% % legend('a1','a2')
% % 
% % figure(4)
% % a_gain = 0.01;
% % [x_predict,e,w] = signLMS(xDelayed, x, a_gain, 3, 3);
% % wScaled = w.*sqrt(sum(b.*b));
% % hold on
% % plot(wScaled(1,:), 'k')
% % plot(wScaled(2,:), 'r')
% % title('Evolution of coefficients using Sign-Sign');
% % xlabel('Sample')
% % ylabel('Coefficient')
% % grid on
% % grid minor
% % legend('a1','a2')
