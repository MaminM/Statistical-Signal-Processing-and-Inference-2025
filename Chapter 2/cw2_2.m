%% Question 1
clc
clear all
close all
% generate white gaussian noise
N = 1000; % 1000-samples per realisation
M = 1; % 1 realisation
x = randn(M,N);
y = filter(ones(1,9), [1], x);

xy_ccf = xcorr(x,y,'unbiased');

% plot
tau_zoomed = -20:20;
xy_cff_zoomed = xy_ccf(-20+1000:20+1000);

figure;
stem(tau_zoomed, xy_cff_zoomed, 'filled'); % Scatter plot with indices on the x-axis
xlabel('Sample number', FontSize=15); % Label for x-axis
ylabel('Value ', FontSize=15); % Label for y-axis
title('CCF of x and y'); % Title for the plot
grid on; % Enable grid for better visibility
fontsize("scale", 1.5)

% R_XY = h(tau) * delta(tau) = h(tau) with noise

%% Question 2

% For system identification?
% To find the impulse response of an unknown system
% send a controlled input and measure the response
% find the CCF between the input and response
% find the ACF of the input
% Theoretically, you should arrive at an unbiased estimator 
% for the impulse response


% Testing effect of filter order on shape of CCF
filter_orders = [1,3,9,20];
for i=1:length(filter_orders)
    
    filter_order = filter_orders(i);

    x = randn(M,N);
    y = filter(ones(1,filter_order), [1], x);
    
    xy_ccf = xcorr(x,y,'unbiased');
    
    % plot
    WIDTH = 50;
    tau_zoomed = -WIDTH:WIDTH;
    xy_cff_zoomed = xy_ccf(-WIDTH+1000:WIDTH+1000);
    
    figure;
    stem(tau_zoomed, xy_cff_zoomed, 'filled'); % Scatter plot with indices on the x-axis
    xlabel('Sample number', FontSize=15); % Label for x-axis
    ylabel('Value ', FontSize=15); % Label for y-axis
    title(['CCF with filter order ' num2str(filter_order)]);
    grid on; % Enable grid for better visibility
    fontsize("scale", 1.5)

end

% superimposed plots
filter_orders = [1,3,9,20];

% array to store CCFs
ccfs = [];

for i=1:length(filter_orders)
    
    filter_order = filter_orders(i);

    x = randn(M,N);
    y = filter(ones(1,filter_order), [1], x);
    
    xy_ccf = xcorr(x,y,'unbiased');
    ccfs = [ccfs; xy_ccf];

    % plot
    WIDTH = 50;
    tau_zoomed = -WIDTH:WIDTH;
    xy_cff_zoomed = xy_ccf(-WIDTH+1000:WIDTH+1000);

end


% % refactor s.t.
% % the values are stored in an array
% % [ccf1; ccf3; ccf5; ...]
% 
% % code to plot all of them on top of each other
% figure;
% hold on
% for i=1:length(filter_orders)
%     filter_order = filter_orders(i);
% 
%     % CCF to plot
%     ccf_to_plot = ccfs(i,:);
%     WIDTH = 50;
%     tau_zoomed = -WIDTH:WIDTH;
%     ccf_zoomed = ccf_to_plot(-WIDTH+1000:WIDTH+1000);
% 
%     stem(tau_zoomed, ccf_zoomed, 'filled', 'DisplayName', sprintf('Filter order %d', filter_order))
% 
% end
% 
% xlabel('Sample number', FontSize=15); % Label for x-axis
% ylabel('Value ', FontSize=15); % Label for y-axis
% grid on
% fontsize("scale", 1.5)
% legend show


%% Question 3

