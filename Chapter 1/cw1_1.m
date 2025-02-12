%% Random Signals and Stochastic Processes 

%% Question 1
x = rand(1,1000);

figure; % Create a new figure
scatter(1:1000, x, 'filled'); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
% title(''); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)


%%
% theoretical mean for the distribution unif(0,1)
% integral from 0 to 1 of x
% upper bound (ub) and lower bound  (lb) are referring to the uniform
% distribution

lb = 0;
ub = 1;
x_axis = linspace(lb, ub, 1e6); % 1e6 points from 0 to 1
dx = x_axis(1,2) - x_axis(1,1);

% defining the probability distribution
pdf_ = ones(1, 1e6) / (ub - lb);
theoretical_mean = trapz(pdf_ .* x_axis) * dx % integral of (x * pdf) dx
measured_mean = mean(x)
percentage_error_mean = abs((theoretical_mean - measured_mean) * 100 / theoretical_mean)

%% Question 2 

% standard deviation
% var = E(X^2) - E(X)^2
% std = sqrt(var)
m1 = theoretical_mean;
m2 = trapz(pdf_ .* x_axis.^2) * dx;
theoretical_std = sqrt(m2 - m1^2)

measured_std = std(x)
percentage_error_std = abs(theoretical_std - measured_std) * 100 / theoretical_std

% i couldn't get the E(X - E(X)) ^2  to work

%% Question 3

x10 = rand(10, 1000);

measured_means = mean(x10') % it collapses the first number in the dimension
bias_means = measured_means - theoretical_mean

measured_stds = std(x10');
bias_stds =  measured_stds - theoretical_std

figure;
scatter(measured_means, zeros(length(measured_means), 1), 'o') % Measured means on x-axis
hold on;
scatter(theoretical_mean, 0, 'x') % Theoretical mean on x-axis
title('Means');
legend('Measured', 'Theoretical');


figure;
scatter(measured_stds, zeros(length(measured_stds), 1), 'o') % Measured means on x-axis
hold on;
scatter(theoretical_std, 0, 'x') % Theoretical mean on x-axis
title('Standard Deviations');
legend('Measured', 'Theoretical');


%% Question 4

data = x;


figure;
histogram(data, 'Normalization', 'pdf'); % the 'Normalization' option will ensure the area = 1
title('Histogram of Data');
hold on
% Define the coordinates for the unit square (from 0 to 1)
x_ = [0 1 1 0]; % x-coordinates of the square
y_ = [0 0 1 1]; % y-coordinates of the square

% Use the 'fill' function to shade the unit square
fill(x_, y_, 'r', 'FaceAlpha', 0.3); % 'b' for blue color with 30% transparency

xlabel('Value');
ylabel('Probability Density');
% Display grid
grid on;


%% Question 5

x = randn(1,1000);

% standard normal distribution parameters
theoretical_mean = 0;
theoretical_std = 1;

% Q5.1 mean

measured_mean = mean(x)
percentage_error_mean = abs((theoretical_mean - measured_mean) * 100 / theoretical_mean)

% Q5.2 std

measured_std = std(x)
percentage_error_std = abs((theoretical_std - measured_std) * 100 / theoretical_std)

% Q5.3 biases plot

x10 = randn(10, 1000);

measured_means = mean(x10'); % it collapses the first number in the dimension
bias_means = measured_means - theoretical_mean

measured_stds = std(x10');
bias_stds =  measured_stds - theoretical_std

figure;
scatter(measured_means, zeros(length(measured_means), 1), 'o') % Measured means on x-axis
hold on;
scatter(theoretical_mean, 0, 'x') % Theoretical mean on x-axis
title('Means');
legend('Measured', 'Theoretical');


figure;
scatter(measured_stds, zeros(length(measured_stds), 1), 'o') % Measured means on x-axis
hold on;
scatter(theoretical_std, 0, 'x') % Theoretical mean on x-axis
title('Standard Deviations');
legend('Measured', 'Theoretical');


% Q5.4 pdf plot

data = x;

% Create histogram of data
figure;
histogram(data, 'Normalization', 'pdf'); % Normalization ensures area = 1
hold on;

% Define x values for the standard normal distribution (PDF)
x = -4:0.01:4; % A range around 0 (mean) for the standard normal distribution
y = normpdf(x, 0, 1); % Standard normal distribution PDF

% Use the 'fill' function to shade the area under the normal distribution curve
fill(x, y, 'r', 'FaceAlpha', 0.3); % 'r' for red color with 30% transparency

% Plot the normal distribution curve
plot(x, y, 'k', 'LineWidth', 2); % Black line for the PDF

% Add title and labels
title('Histogram and Shaded Standard Normal Distribution');
xlabel('Value');
ylabel('Probability Density');

% Display grid
grid on;
