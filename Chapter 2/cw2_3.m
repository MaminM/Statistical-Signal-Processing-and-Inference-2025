%% Question 1
clc
close all
clear all

K = 1000; % number of random coeffs pairs
a1_list = rand(1,K)*5 - 2.5;
a2_list = rand(1,K)*3 - 1.5;
N = 1000; % length of x

% initialise the list to store coordinates of converging pairs
% coeff_converge = [];
% coeff_diverge = [];
a1_converge = [];
a2_converge = [];
a1_diverge = [];
a2_diverge = [];
% theoretical
a1_theory_conv = [];
a2_theory_conv = [];
a1_theory_div = [];
a2_theory_div = [];
% correct and errors
a1_correct = [];
a2_correct = [];
a1_err = [];
a2_err = [];
% false pos, false neg, true pos, true neg
a1_true_pos = [];
a2_true_pos = [];
a1_true_neg = [];
a2_true_neg = [];
a1_false_pos = [];
a2_false_pos = [];
a1_false_neg = [];
a2_false_neg = [];

for i = 1:K
    % extract this iterations coefficient
    a1 = a1_list(i);
    a2 = a2_list(i);
    
    % ROOTS OF CHAR POLYNOMIAL - theoretical justification 
    % To do:
    % > find roots
    % > find if 'should' converge
    % > if true -> add to a1/a2_theory_conv
    % > if false-> add to a1/a2_theory_div
    a = [1, -a1, -a2];
    z = roots(a);
    theoretical_converge = all(abs(z) < 1);
    if theoretical_converge
        a1_theory_conv = [a1_theory_conv, a1];
        a2_theory_conv = [a2_theory_conv, a2];
    else
        a1_theory_div = [a1_theory_div, a1];
        a2_theory_div = [a2_theory_div, a2];
    end
    % not all roots are inside
    % but maybe
    
    % do majority vote on covergence
    converges = 0;
    TRIAL_COUNT = 50;
    THRESHOLD = (TRIAL_COUNT-1)/2;
    for TRIAL_ITER = 1:TRIAL_COUNT        
        % generate the signal
        % assume x(1) = randn; x(2) = randn
        % the choice of initial value may introduce a transient
        % this implies that we must consider stability of this transient
        if false
           x_initial = zeros(1,2); 
           title_str = 'x(1) = x(2) = 0';
        else
           x_initial = randn(1,2); 
           title_str = 'x(1) = x(2) = randn';
        end
    
        x = [x_initial , zeros(1,N-2)];
    
        % assume it converges initially
        converge = true;
        
        % generate x samples from 3:1000
        for n =3:1000
            if (converge == true)
                x(n) = a1*x(n-1) + a2*x(n-2) + randn;
            end
    
            % update converge
            if x(n) > 1e3
                converge = false;
            end
        end
        converges = converges + int16(converge);

    end % end of TRIAL_ITER loop
    
    converge = converges > THRESHOLD;

    % store converging coefficients
    if converge
        % coeff_converge = [coeff_converge; a1, a2];
        a1_converge = [a1_converge, a1];
        a2_converge = [a2_converge, a2];

    else
        % coeff_diverge = [coeff_diverge; a1, a2];
        a1_diverge = [a1_diverge, a1];
        a2_diverge = [a2_diverge, a2];
    end
    
    % generate an correct and error vector
    % correct if (converge = theoretical_converge)
    % error otherwise
    if (not(xor(converge, theoretical_converge)))
        a1_correct = [a1_correct, a1];
        a2_correct = [a2_correct, a2];
    else
        a1_err = [a1_err, a1];
        a2_err = [a2_err, a2];
    end

    % true positive
    if theoretical_converge && converge
        a1_true_pos = [a1_true_pos, a1];
        a2_true_pos = [a2_true_pos, a2];
    % true negative
    elseif not(theoretical_converge) && not(converge)
        a1_true_neg = [a1_true_neg, a1];
        a2_true_neg = [a2_true_neg, a2];
    % false positive - predict converge when it diverged
    elseif theoretical_converge && not(converge)
        a1_false_pos = [a1_false_pos, a1];
        a2_false_pos = [a2_false_pos, a2];
    elseif not(theoretical_converge) && converge
    % false negative - predict diverge when it converged
        a1_false_neg = [a1_false_neg, a1];
        a2_false_neg = [a2_false_neg, a2];
    end

end

fnt= 16; % fontsize

figure;
scatter(a1_converge, a2_converge, 'blue', 'o')
hold on
scatter(a1_diverge, a2_diverge, 'red', 'o')
scatter(a1_theory_conv, a2_theory_conv, 'blue', 'x')
scatter(a1_theory_div, a2_theory_div, 'red', 'x')
xlabel('a1')
ylabel('a2')
fontsize(fnt, 'points')
legend('Converge', 'Diverge', 'Theoretical Convergence', 'Theoretical Divergence', 'fontsize', 10)
title(['Measured Results: ',title_str])
xlim([-2.5, 2.5])
ylim([-1.5, 1.5])

% figure;
% scatter(a1_theory_conv, a2_theory_conv, 'blue', 'x')
% hold on
% scatter(a1_theory_div, a2_theory_div, 'red', 'x')
% xlabel('a1')
% ylabel('a2')
% legend('Converge', 'Diverge')
% title(['Theoretical Convergence Results: ',title_str])
% xlim([-2.5, 2.5])
% ylim([-1.5, 1.5])

% plot a figure for when the prediction didn't match the realisation
gray_hex = '#808080';
soft_blue_hex = '#87CEEB';
figure;
scatter(a1_err, a2_err, 100, '.', 'MarkerEdgeColor', gray_hex)
hold on
scatter(a1_correct, a2_correct, '.', 'MarkerEdgeColor', soft_blue_hex)
legend('Error', 'Correct')
xlabel('a1')
ylabel('a2')
title(['Errors in convergence prediction: ',title_str])
xlim([-2.5, 2.5])
ylim([-1.5, 1.5])
fontsize(fnt, 'points')


% % plot true/false pos/neg
% figure;
% scatter(a1_true_pos, a2_true_pos, "blue", 'o')
% hold on
% scatter(a1_true_neg, a2_true_neg, "blue", 'x')
% scatter(a1_false_pos, a2_false_pos, 'red', 'o')
% scatter(a1_false_neg, a2_false_neg, 'red', 'x')
% legend('true pos', 'true neg', 'false pos', 'false neg')
% xlabel('a1')
% ylabel('a2')
% title(['Errors in convergence prediction: ',title_str])
% xlim([-2.5, 2.5])
% ylim([-1.5, 1.5])

%% Question 2
%
clc
clear all
close all

load sunspot.dat % 288x2 ( year, number of sunspots ) 

% ACF
sunspot_data = sunspot(:, 2);
years = sunspot(:, 1);
sunspot_ACF = xcorr(sunspot_data, 'unbiased');

% lag of 5, 20 and 250
lengths = [5, 20, 250];

for i=1:length(lengths)
    
    L = lengths(i);
    tau = -L:L;
    ACF = sunspot_ACF(-L+289:L+289);
    
    figure;
    plot(tau, ACF)
    xlabel('tau')
    ylabel('ACF of sunspot data')
    title(['Length = ,', int2str(L)])

end

% ZERO MEAN ACF

sunspot_data_zero_mean = sunspot_data - mean(sunspot_data);
sunspot_data_zero_mean_ACF = xcorr(sunspot_data_zero_mean, 'unbiased');

% lag of 5, 20 and 250
lengths = [5, 20, 250];
w
for i=1:length(lengths)
    
    L = lengths(i);
    tau = -L:L;
    ACF = sunspot_data_zero_mean_ACF(-L+289:L+289);
    
    figure;
    plot(tau, ACF)
    xlabel('tau')
    ylabel('ACF of sunspot data')
    title(['ZERO MEAN | Length = ,', int2str(L)])

end


%% Question 3
clear all
close all 
clc

load sunspot.dat
ss_data = sunspot(:, 2);
ss_data_ACF = xcorr(ss_data, 'unbiased');

% Finding Yule Walker Coefficients
data = ss_data_ACF;

MAX_MODEL_ORDER = 10; 
OFFSET = (length(data) - 1)/2;

% storing output coefficients - a's
a_matrix = zeros(MAX_MODEL_ORDER,MAX_MODEL_ORDER);
% aryule_matrix = zeros(MAX_MODEL_ORDER, MAX_MODEL_ORDER);

% storing the ACFs 
LENGTH_OF_ACFs = 575;
ACFs = zeros(LENGTH_OF_ACFs,MAX_MODEL_ORDER);
for p=1:MAX_MODEL_ORDER
    % Does WORK ! (Lecture 2 Slide 27)
    [aryule_a,aryule_e] = aryule(data, p);
    aryule_matrix(p, 1:p+1) = aryule_a;
    
    % generate data using the coefficients
    M = 1;
    N = 288;
    e = randn(N,M);
    x(:, p) = filter(1, aryule_a, e);

end

MODEL_ORDERS_TO_PLOT = [1,2,3];
LENGTH_TO_PLOT = 250;

for order_i=1:length(MODEL_ORDERS_TO_PLOT)
    model_order = MODEL_ORDERS_TO_PLOT(order_i);

    % figure for ONE length
    ywdata = x(:, model_order);
    ywdata_ACF = xcorr(ywdata, 'unbiased');
    
    L = LENGTH_TO_PLOT;
    tau = -L:L;
    ACF = ywdata_ACF(-L+OFFSET:L+OFFSET);
    
    % figure;
    % plot(tau,ACF)
    % xlabel('tau')
    % ylabel('ACF')
    % title(['ACF of Yule-Walker | p = ,', int2str(model_order)])
end

% Calculate and plot the PSD using FFT of the autocorrelation function
N = length(ss_data);
L = 2*N-1; % Length of the ACF
fs = 1; % Assuming 1 sample per year for sunspot data

% Compute the PSD using FFT of the ACF (Wiener-Khinchin theorem)
ss_PSD = fft(ss_data_ACF);
ss_PSD = abs(ss_PSD(1:floor(L/2)+1));
ss_PSD = ss_PSD/L; % Normalize by signal length

% % Create frequency vector
f = (0:floor(L/2))*fs/L;
% Create normalized angular frequency vector (ω/π)
omega_norm = f * 2 * pi / fs; % Convert to angular frequency and normalize

% Generate theoretical PSD from YW coefficients
model_order = 2;
a = aryule_matrix(model_order, 1:model_order+1);
Theoretical_PSD = abs(freqz(1,a,N,1)).^ 2 ;

figure
hold on
plot(omega_norm, 10*log10(ss_PSD), 'Color', '#000000', 'LineStyle', '--', 'DisplayName', 'Measured PSD');
for p=1:MAX_MODEL_ORDER
    a = aryule_matrix(p, 1:p+1);
    Theoretical_PSD = abs(freqz(1,a,N,1)).^ 2 ;
    plot(omega_norm, 10*log10(Theoretical_PSD), 'DisplayName', ['Theoretical p = ', int2str(p)]);
end
title('Power Spectral Density of Sunspot Data');
xlabel('Normalized Angular Frequency (ω/π)');
ylabel('Power/Frequency (dB)');
xlim([0,pi])
legend;
grid on;



% doing the same on zero mean, unit variance data
ss_scaled = zscore(ss_data);
ss_scaled_ACF = xcorr(ss_scaled, 'unbiased');





        
%% Question 3 - Attempt 2, from Lec 2, slide 44
clear all 
close all 
clc

load sunspot.dat
ss_data = sunspot(:, 2);
ss_data_ACF = xcorr(ss_data, 'unbiased');

data = ss_data_ACF;
MAX_MODEL_ORDER = 10; 
OFFSET = (length(data) - 1)/2;

a_matrix = zeros(MAX_MODEL_ORDER,MAX_MODEL_ORDER);
% PACF defined in Lec 2, Appendix 5 as the diagonal of a_matrix
pacf = zeros(1, MAX_MODEL_ORDER);

% compute coefficients
for p=1:MAX_MODEL_ORDER
    [aryule_a,aryule_e] = aryule(data, p);
    a_matrix(p, 1:p) = -1 * aryule_a(2:p+1);
    pacf(1, p) = a_matrix(p, p);
end

% zero mean and unit variance
ss_scaled = zscore(ss_data);
ss_scaled_ACF = xcorr(ss_scaled, 'unbiased');

% Finding Yule Walker Coefficients
data = ss_scaled_ACF;
MAX_MODEL_ORDER = 10; 
OFFSET = (length(data) - 1)/2;

a_scaled_matrix = zeros(MAX_MODEL_ORDER,MAX_MODEL_ORDER);
% storing PACF as defined in Lec 2, Appendix 5 as the diagonal of a_matrix
pacf_scaled = zeros(1, MAX_MODEL_ORDER);

% compute coefficients
for p=1:MAX_MODEL_ORDER
    [aryule_a,aryule_e] = aryule(data, p);
    a_scaled_matrix(p, 1:p) = -1 * aryule_a(2:p+1);
    pacf_scaled(1, p) = a_scaled_matrix(p, p);
end

% Combined PACF Plot
figure;
hold on;

% Plot scaled PACF with stem plot
stem(1:length(pacf), pacf, 'b', 'LineWidth', 1, 'DisplayName','original'); % Blue, thinner, dashed
% zero mean, unit variance
stem(1:length(pacf_scaled), pacf_scaled, 'k', 'LineWidth', 1.5, 'DisplayName', '$\mu = 0$, $\sigma = 1$');


% Plot confidence intervals (hide from legend)
plot(0:length(pacf_scaled)+1, ones(1, length(pacf_scaled)+2) * (1.96 / sqrt(288)), 'Color', 'red', 'LineStyle', '--', 'HandleVisibility', 'off');
plot(0:length(pacf_scaled)+1, ones(1, length(pacf_scaled)+2) * -(1.96 / sqrt(288)), 'Color', 'red', 'LineStyle', '--', 'HandleVisibility', 'off');

fnt = 15;
% Grid and labels
grid on;
xlabel('tau');
ylabel('Amplitude');
title('Partial Autocorrelation Function');
fontsize(fnt, 'points')
legend('Interpreter', 'latex', 'FontSize', 15);
% Adjust x-axis limits
xlim([0, length(pacf_scaled) + 1]);

%% Question 4
clc
close all
clear

load sunspot.dat

MAX_MODEL_ORDER = 10;
ss = sunspot(:,2);
ss_scaled = zscore(ss);
N = length(ss_scaled(:,1));


% matrix to store predictions
pred = zeros(N, 10);
% store YW coeffs
a_matrix = zeros(MAX_MODEL_ORDER+1, MAX_MODEL_ORDER);


% find yw coeffs
for p=1:MAX_MODEL_ORDER
    [aryule_a, aryule_e] = aryule(ss_scaled, p);
    a_matrix(p, 1:p+1) = aryule_a(1:p+1);
    pred(:, p) = filter(-1*aryule_a, 1, ss_scaled);
end
% each column is a prediction 

Ep = zeros(N, MAX_MODEL_ORDER);
o = ones(1,MAX_MODEL_ORDER);
% initial value
Ep(1,:) = (pred(1,:) - o* ss_scaled(1));



for i=2:N % Can't start with index 1 because of Ep(i-1)
    Ep(i,:) = (pred(i,:)-o*ss_scaled(i)).^2 + Ep(i-1,:);
end


% MDL = log(Ep(N,(1:MAX_MODEL_ORDER))) + (1:MAX_MODEL_ORDER)*log(N)/N;
% AIC = log(Ep(N,(1:MAX_MODEL_ORDER))) + (1:MAX_MODEL_ORDER)*2/N;
% AICc = AIC + (2*(1:MAX_MODEL_ORDER) .* (1:MAX_MODEL_ORDER))/(N-(1:MAX_MODEL_ORDER)-1);

CMSE = Ep(end, :);
p = 1:MAX_MODEL_ORDER;
MDL = log(CMSE) + (p + log(N)) / N;
AIC = log(CMSE) + 2*p/N;
AICc = AIC + (2 * p .* (p + 1))./(N-1 -1*p);


% Plotting
figure;
hold on;
linewidth = 1;
fontsize = 16;

% Plot lines with DisplayName for legend
h1 = plot(1:MAX_MODEL_ORDER, MDL, 'b-', 'DisplayName', 'MDL', 'LineWidth', linewidth);
h2 = plot(1:MAX_MODEL_ORDER, AIC, 'r-', 'DisplayName', 'AIC', 'LineWidth', linewidth);
h3 = plot(1:MAX_MODEL_ORDER, AICc, 'm-', 'DisplayName', 'AICc', 'LineWidth', linewidth);
h4 = plot(1:MAX_MODEL_ORDER, log(CMSE),'y' ,'DisplayName', 'Cumulative squared error', 'LineWidth',linewidth);

% Plot scatter without DisplayName (will be excluded from legend)
scatter(1:MAX_MODEL_ORDER, MDL, 'b');
scatter(1:MAX_MODEL_ORDER, AIC, 'r');
scatter(1:MAX_MODEL_ORDER, AICc, 'm' );
scatter(1:MAX_MODEL_ORDER, log(CMSE), 'y');

xlim([1,MAX_MODEL_ORDER]);
ylim([5.8,7]);

xticks(1:MAX_MODEL_ORDER); % Add ticks for each model order
title('Model Selection Criteria', 'FontSize', fontsize);
xlabel('Model Order', 'FontSize', fontsize);
ylabel('Criterion Value', 'FontSize', fontsize);

% Specify the handles of the plots to include in the legend
legend([h1, h2, h3, h4], 'FontSize', fontsize);

grid on; % Optional: Add a grid for better readability
hold off;
%% Question 5

load sunspot.dat

ss = sunspot(:,2);
data = zscore(ss);

% Load the sunspot data (assumed to be a 288x1 array called 'data')
N = length(data);
train_ratio = 0.8;
train_size = round(train_ratio * N);

train_data = data(1:train_size);
test_data = data(train_size+1:end);

orders = [1, 2, 10]; % AR model orders
horizons = [1, 2, 5, 10]; % Prediction horizons

% Store predictions
predictions = cell(length(orders), length(horizons));

% Fit AR models and predict
for i = 1:length(orders)
    p = orders(i);
    model = ar(train_data, p, 'ls'); % Fit AR model using least squares

    for j = 1:length(horizons)
        m = horizons(j);
        preds = zeros(length(test_data) - m, 1);

        for k = 1:length(test_data) - m
            history = [train_data; test_data(1:k)]; % Update history
            model_dyn = ar(history, p, 'ls'); % Refit AR model
            pred = predict(model_dyn, history, m);
            preds(k) = pred(end);
        end

        predictions{i, j} = preds;
    end
end


% Plot actual vs Predicted

figure;
hold on;
colors = lines(length(orders)); % Generate distinct colors

for i = 1:length(orders)
    for j = 1:length(horizons)
        subplot(length(orders), length(horizons), (i-1) * length(horizons) + j);
        plot(test_data(horizons(j)+1:end), 'k', 'DisplayName', 'Actual');
        hold on;
        plot(predictions{i, j}, 'Color', colors(i, :), 'LineStyle', '--', 'DisplayName', sprintf('AR(%d)', orders(i)));
        title(sprintf('AR(%d), Horizon %d', orders(i), horizons(j)));
    end
end

% Create a single legend outside the subplots
hold off;
legend_entries = [{'Actual'}, arrayfun(@(p) sprintf('AR(%d)', p), orders, 'UniformOutput', false)];
legend(legend_entries, 'Position', [0.8, 0.1, 0.1, 0.1]); % Adjust position as needed
