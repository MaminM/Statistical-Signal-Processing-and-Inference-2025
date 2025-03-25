%% Question 1
clc
clear all
close all

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
theoretical_mean = trapz(pdf_ .* x_axis) * dx; % integral of (x * pdf) dx
measured_mean = mean(x);
percentage_error_mean = abs((theoretical_mean - measured_mean) * 100 / theoretical_mean);

%% Question 2 

% standard deviation
% var = E(X^2) - E(X)^2
% std = sqrt(var)
m1 = theoretical_mean;
m2 = trapz(pdf_ .* x_axis.^2) * dx;
theoretical_std = sqrt(m2 - m1^2);

measured_std = std(x)
percentage_error_std = abs(theoretical_std - measured_std) * 100 / theoretical_std

% i couldn't get the E(X - E(X)) ^2  to work

%% Question 3

x10 = rand(10, 1000);

measured_means = mean(x10') % it collapses the first number in the dimension
bias_means = measured_means - theoretical_mean

measured_stds = std(x10')
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
x = rand(1,1000);
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
%% Question 4, done again
% Sample sizes to vary
sample_sizes = [100, 1000, 5000, 10000];

% Number of bins to vary
bin_sizes = [10, 50, 100, 500];

% Create a figure for the plots
figure;

% Create a tiled layout with 2 rows and 4 columns
tiledlayout(2, 4);

% Plot histograms with different sample sizes (first row)
for i = 1:4
    data = rand(1, sample_sizes(i)); % Generate data with different sample sizes
    
    nexttile; % Move to the next tile in the layout
    histogram(data, 'Normalization', 'pdf', 'BinMethod', 'auto'); % Create histogram with default binning
    title(['Samples = ' num2str(sample_sizes(i))]);
    hold on;
    
    % Define the coordinates for the unit square (from 0 to 1)
    x_ = [0 1 1 0]; % x-coordinates of the square
    y_ = [0 0 1 1]; % y-coordinates of the square
    
    % Shade the unit square
    fill(x_, y_, 'r', 'FaceAlpha', 0.3); % 'r' for red color with 30% transparency
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Plot histograms with different number of bins (second row)
for i = 1:4
    data = rand(1, 1000); % Generate data with 1000 samples
    
    nexttile; % Move to the next tile in the layout
    histogram(data, 'Normalization', 'pdf', 'BinEdges', linspace(0, 1, bin_sizes(i)+1)); % Specify bins based on the bin sizes
    title(['Bins = ' num2str(bin_sizes(i))]);
    hold on;
    
    % Define the coordinates for the unit square (from 0 to 1)
    x_ = [0 1 1 0]; % x-coordinates of the square
    y_ = [0 0 1 1]; % y-coordinates of the square
    
    % Shade the unit square
    fill(x_, y_, 'r', 'FaceAlpha', 0.3); % 'r' for red color with 30% transparency
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Adjust y-axis to be shared across rows
for i = 1:4
    % Set the y-axis limit to be the same for all subplots in each row
    ylim([0 5]); % Adjust this range if needed
end

%% Question 4, done twice over
% Sample sizes to vary
sample_sizes = [100, 1000, 5000, 10000];

% Number of bins to vary
bin_sizes = [10, 50, 100, 500];

% Create a figure for the plots
figure;

% Create a tiled layout with 2 rows and 4 columns
tiledlayout(2, 4);

% Plot histograms with different sample sizes (first row)
for i = 1:4
    data = rand(1, sample_sizes(i)); % Generate data with different sample sizes
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'BinMethod', 'auto'); % Create histogram with default binning
    hold on;
    
    % Define the coordinates for the unit square (from 0 to 1)
    x_ = [0 1 1 0]; % x-coordinates of the square
    y_ = [0 0 1 1]; % y-coordinates of the square
    
    % Shade the unit square
    fill(x_, y_, 'r', 'FaceAlpha', 0.3); % 'r' for red color with 30% transparency
    
    % Calculate the theoretical and measured PDF
    x_theoretical = linspace(0, 1, 100);
    y_theoretical = ones(size(x_theoretical)); % Theoretical PDF for uniform distribution
    
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2; % Midpoints of bins
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Set the title with MSE
    title(['Samples = ' num2str(sample_sizes(i)) ', MSE = ' num2str(MSE, '%.4f')]);
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Plot histograms with different number of bins (second row)
for i = 1:4
    data = rand(1, 1000); % Generate data with 1000 samples
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'BinEdges', linspace(0, 1, bin_sizes(i)+1)); % Specify bins based on the bin sizes
    hold on;
    
    % Define the coordinates for the unit square (from 0 to 1)
    x_ = [0 1 1 0]; % x-coordinates of the square
    y_ = [0 0 1 1]; % y-coordinates of the square
    
    % Shade the unit square
    fill(x_, y_, 'r', 'FaceAlpha', 0.3); % 'r' for red color with 30% transparency
    
    % Calculate the theoretical and measured PDF
    x_theoretical = linspace(0, 1, 100);
    y_theoretical = ones(size(x_theoretical)); % Theoretical PDF for uniform distribution
    
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2; % Midpoints of bins
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Set the title with MSE
    title(['Bins = ' num2str(bin_sizes(i)) ', MSE = ' num2str(MSE, '%.4f')]);
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Adjust y-axis to be shared across rows
for i = 1:4
    % Set the y-axis limit to be the same for all subplots in each row
    ylim([0 5]); % Adjust this range if needed
end

%% Question 5
% plot
x = randn(1,1000);

figure; % Create a new figure
scatter(1:1000, x, 'filled'); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
% title(''); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)

%%
x = randn(1,1000);

% standard normal distribution parameters
theoretical_mean = 0;
theoretical_std = 1;

% % Q5.1 mean
% 
% measured_mean = mean(x)
% percentage_error_mean = abs((theoretical_mean - measured_mean) * 100 / theoretical_mean)
% 
% % Q5.2 std
% 
% measured_std = std(x)
% percentage_error_std = abs((theoretical_std - measured_std) * 100 / theoretical_std)

%% Q5.3 biases plot

x10 = randn(10, 1000);

measured_means = mean(x10'); 
bias_means = measured_means - theoretical_mean

measured_stds = std(x10');
bias_stds =  measured_stds - theoretical_std
%%
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


%% Q5.4 pdf plot

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

%% Question 5, plot twice

% Sample sizes to vary
sample_sizes = [100, 1000, 5000, 10000];

% Number of bins to vary
bin_sizes = [10, 50, 100, 500];

% Create a figure for the plots
figure;

% Create a tiled layout with 2 rows and 4 columns
tiledlayout(2, 4);

% Plot histograms with different sample sizes (first row)
for i = 1:4
    data = randn(1, sample_sizes(i)); % Generate data with different sample sizes from a standard normal distribution
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'BinMethod', 'auto'); % Create histogram with default binning
    hold on;
    
    % Define the x values for the standard normal distribution PDF
    x_theoretical = linspace(-4, 4, 100); % Typically, for standard normal we plot from -4 to 4
    y_theoretical = (1/sqrt(2*pi)) * exp(-0.5 * x_theoretical.^2); % Theoretical PDF of the standard normal distribution
    
    % Midpoints of histogram bins
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2;
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Plot the theoretical PDF
    plot(x_theoretical, y_theoretical, 'r', 'LineWidth', 2); % Red line for theoretical PDF
    
    % Set the title with MSE
    title(['Samples = ' num2str(sample_sizes(i)) ', MSE = ' num2str(MSE, '%.4f')]);
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Plot histograms with different number of bins (second row)
for i = 1:4
    data = randn(1, 1000); % Generate data with 1000 samples from a standard normal distribution
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'BinEdges', linspace(-4, 4, bin_sizes(i)+1)); % Specify bins based on the bin sizes
    hold on;
    
    % Define the x values for the standard normal distribution PDF
    x_theoretical = linspace(-4, 4, 100);
    y_theoretical = (1/sqrt(2*pi)) * exp(-0.5 * x_theoretical.^2); % Theoretical PDF for standard normal distribution
    
    % Midpoints of histogram bins
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2;
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Plot the theoretical PDF
    plot(x_theoretical, y_theoretical, 'r', 'LineWidth', 2); % Red line for theoretical PDF
    
    % Set the title with MSE
    title(['Bins = ' num2str(bin_sizes(i)) ', MSE = ' num2str(MSE, '%.4f')]);
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Adjust y-axis to be shared across rows
for i = 1:4
    % Set the y-axis limit to be the same for all subplots in each row
    ylim([0 0.5]); % Adjusted range for standard normal distribution
end


%% Question 5, thrice over

% Sample sizes to vary
sample_sizes = [100, 1000, 5000, 10000];

% Number of bins to vary
bin_sizes = [10, 50, 100, 200];

% Fixed number of bins for the first row
num_bins = 30;

% Create a figure for the plots
figure;

% Create a tiled layout with 2 rows and 4 columns
tiledlayout(2, 4);

% Plot histograms with different sample sizes (first row)
for i = 1:4
    data = randn(1, sample_sizes(i)); % Generate data with different sample sizes from a standard normal distribution
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'NumBins', num_bins); % Create histogram with fixed number of bins
    hold on;
    
    % Define the x values for the standard normal distribution PDF
    x_theoretical = linspace(-4, 4, 100); % Typically, for standard normal we plot from -4 to 4
    y_theoretical = (1/sqrt(2*pi)) * exp(-0.5 * x_theoretical.^2); % Theoretical PDF of the standard normal distribution
    
    % Midpoints of histogram bins
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2;
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Plot the theoretical PDF
    plot(x_theoretical, y_theoretical, 'r', 'LineWidth', 2); % Red line for theoretical PDF
    
    % Set the title with MSE
    title(['Samples = ' num2str(sample_sizes(i)) ', MSE = ' num2str(MSE, '%.4f')]);
    
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Plot histograms with different number of bins (second row)
for i = 1:4
    data = randn(1, 1000); % Generate data with 1000 samples from a standard normal distribution
    
    % Ensure number of bins does not exceed number of samples
    num_bins = min(bin_sizes(i), length(data));
    
    nexttile; % Move to the next tile in the layout
    h = histogram(data, 'Normalization', 'pdf', 'NumBins', num_bins); % Use adjusted number of bins
    hold on;
    
    % Define the x values for the standard normal distribution PDF
    x_theoretical = linspace(-4, 4, 100);
    y_theoretical = (1/sqrt(2*pi)) * exp(-0.5 * x_theoretical.^2); % Theoretical PDF for standard normal distribution
    
    % Midpoints of histogram bins
    x_measured = h.BinEdges(1:end-1) + diff(h.BinEdges)/2;
    y_measured = h.Values / sum(h.Values) / diff(h.BinEdges(1:2)); % Normalize histogram to form PDF
    
    % Calculate MSE
    MSE = mean((y_measured - y_theoretical(1:length(y_measured))).^2);
    
    % Plot the theoretical PDF
    plot(x_theoretical, y_theoretical, 'r', 'LineWidth', 2); % Red line for theoretical PDF
    
    % Set the title with MSE
    title(['Bins = ' num2str(num_bins) ', MSE = ' num2str(MSE, '%.4f')]); % Display the adjusted number of bins
    if i == 4
        num_bins = num_bins
        MSE = MSE

    end
    xlabel('Value');
    ylabel('Probability Density');
    grid on;
end

% Adjust y-axis to be shared across rows
for i = 1:4
    % Set the y-axis limit to be the same for all subplots in each row
    ylim([0 0.5]); % Adjusted range for standard normal distribution
end
