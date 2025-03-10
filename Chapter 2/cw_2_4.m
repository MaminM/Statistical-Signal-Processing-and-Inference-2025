clc
clear all
close all

load sunspot.dat % 288x2 ( year, number of sunspots ) 


% figure;
% plot(sunspot(:, 1), sunspot(:, 2))
% xlabel('Year')
% ylabel('Number of sunspots')


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

%% Zero Mean ACF

sunspot_data_zero_mean = sunspot_data - mean(sunspot_data);
sunspot_data_zero_mean_ACF = xcorr(sunspot_data_zero_mean, 'unbiased');

% lag of 5, 20 and 250
lengths = [5, 20, 250];

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