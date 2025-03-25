%% 1.2 Question 1
% Ensemble mean as function of time

clc
clear all
close all

N = 100;
M = 100;
%%
% rp1
f1 = rp1(M, N);
f1_ensemble_mean = mean(f1, 1);
f1_ensemble_std = std(f1,1);
% rp2
f2 = rp2(M, N);
f2_ensemble_mean = mean(f2, 1);
f2_ensemble_std = std(f2,1);
% rp3
f3 = rp3(M, N);
f3_ensemble_mean = mean(f3, 1);
f3_ensemble_std = std(f3,1);
%% Theoretical std and mean

% rp1
f1_theory_mean = 0.02* (1:N);
f1_theory_std = sqrt((25/12) * (sin((1:N)*pi/N)).^2);

% rp2
f2_theory_mean = 7/12 * ones(1,N);
f2_theory_std = sqrt(417/2160 * ones(1,N));
% rp3
f3_theory_mean = 0.5 * ones(1,N);
f3_theory_std = sqrt(0.75) * ones(1,N);

figure;

% Subplot 1: Ensemble means
subplot(1, 2, 1);
plot(f1_ensemble_mean, 'Color', 'blue', 'LineWidth', 0.7);
hold on;
plot(f1_theory_mean, 'Color', 'blue', 'LineStyle', '--');
plot(f2_ensemble_mean, 'Color', 'red', 'LineWidth', 0.7);
plot(f2_theory_mean, 'Color', 'red', 'LineStyle', '--');
plot(f3_ensemble_mean, 'Color', 'green', 'LineWidth', 0.7);
plot(f3_theory_mean, 'Color', 'green', 'LineStyle', '--');
xlabel('Time', 'fontsize', 15);
ylabel('Amplitude', 'fontsize', 15);
title("Ensemble means");
legend('rp1 measured', 'rp1 theoretical', 'rp2 measured', 'rp2 theoretical', 'rp3 measured', 'rp3 theoretical');
set(gca, 'FontSize', 15); % Set fontsize for current axes
hold off;

% Subplot 2: Ensemble standard deviations
subplot(1, 2, 2);
plot(f1_ensemble_std, 'Color', 'blue', 'LineWidth', 0.7);
hold on;
plot(f1_theory_std, 'Color', 'blue', 'LineStyle', '--');
plot(f2_ensemble_std, 'Color', 'red', 'LineWidth', 0.7);
plot(f2_theory_std, 'Color', 'red', 'LineStyle', '--');
plot(f3_ensemble_std, 'Color', 'green', 'LineWidth', 0.7);
plot(f3_theory_std, 'Color', 'green', 'LineStyle', '--');
xlabel('Time', 'fontsize', 15);
ylabel('Amplitude', 'fontsize', 15);
title("Ensemble standard deviations");
% legend('rp1 measured', 'rp1 theoretical', 'rp2 measured', 'rp2 theoretical', 'rp3 measured', 'rp3 theoretical');
set(gca, 'FontSize', 15); % Set fontsize for current axes
hold off;