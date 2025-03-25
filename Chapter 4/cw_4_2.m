%% Question 1
clear all;
close all;
clc;

x = randn(1, 1000);
% 4th order filter
% Filter it x
y = filter([1 2 3 2 1], 1, x);
n = 0.1 * randn(1, 1000);
z = y + n;
u = [0.002, 0.01, 0.08, 0.5];

filterOrder = 4; % Define the filter order

for stepIndex = 1:length(u)
    stepSize = u(stepIndex);

    % Apply LMS algorithm
    [estimatedOutput, errorSignal, filterWeights] = lms(x, z, stepSize, filterOrder);

    % Display the optimal weights (last set of weights)
    optimalWeights = filterWeights(:, end);
    fprintf('Step Size (\\mu) = %f\n', stepSize);
    fprintf('Optimal Weights:\n');
    disp(optimalWeights);

    % Plotting (optional, for visualization)
    figure;

    % Plot estimated output vs desired signal
    subplot(2, 1, 1);
    plot(1:length(z), z, 'b', 'DisplayName', 'Desired Signal');
    hold on;
    plot(1:length(estimatedOutput), estimatedOutput, 'r', 'DisplayName', 'Estimated Output');
    hold off;
    xlabel('Sample Index');
    ylabel('Signal Value');
    title(sprintf('Estimated Output vs. Desired Signal (\\mu = %f)', stepSize));
    legend;
    grid on;

    % Plot error signal
    subplot(2, 1, 2);
    plot(1:length(errorSignal), errorSignal);
    xlabel('Sample Index');
    ylabel('Error Signal');
    title(sprintf('Error Signal (\\mu = %f)', stepSize));
    grid on;

end

%% Question 2
close all
clear 
clc

% Generate input signal and desired signal
inputSignal = randn(1, 1000);
desiredSignal = filter([1, 2, 3, 2, 1], 1, inputSignal) + 0.1 * randn(1, 1000);

% LMS step sizes to test
stepSizes = [0.002, 0.01, 0.08, 0.5];

% Filter order
filterOrder = 4;

% Create figures for coefficients and error
figure; % Figure for coefficients
figure; % Figure for error

% Process LMS for each step size
for stepIndex = 1:length(stepSizes)
    stepSize = stepSizes(stepIndex);

    % Apply LMS algorithm
    [estimatedOutput, error, coefficients] = lms(inputSignal, desiredSignal, stepSize, filterOrder);

    % Plot filter coefficients over iterations (subplots)
    figure(1); % Switch to coefficients figure
    subplot(1, 4, stepIndex); % Create subplot (4 subplots horizontally)
    hold on;
    for coefficientIndex = 1:filterOrder
        plot(1:size(coefficients, 2), coefficients(coefficientIndex, :), 'LineWidth', 2);
    end
    hold off;
    grid on;
    xlim([1, size(coefficients, 2)]);
    xlabel('Iteration');
    ylabel('Coefficient Value');
    title(sprintf('\\mu = %1.3f', stepSize));

    % Plot squared error over iterations (subplots)
    figure(2); % Switch to error figure
    subplot(1, 4, stepIndex); % Create subplot (4 subplots horizontally)
    plot(1:length(error), error.^2);
    grid on;
    xlabel('Iteration');
    ylabel('Squared Error');
    title(sprintf('\\mu = %1.3f', stepSize));
end

% Adjust figure 1 to show all plots
figure(1);
sgtitle('Estimated Coefficients');

% Adjust figure 2 to show all plots
figure(2);
sgtitle('Squared Error Evolution');