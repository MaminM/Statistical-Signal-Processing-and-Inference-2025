%% Question 1 - pdf function on Gaussain stationary

N = 10000;
v = randn(1,N);

[edges, pdf_vals] = my_pdf(v, 100);


%% Question 2 - process 2 and 3

M = 1; % one realisation
Ns = [100, 1000, 10000];

stored_edges = {};
stored_vals = {};

for i=1:3
    N = Ns(i);
    % number_of_bins = int16(N/10);
    number_of_bins = 10;
    
    v = rp2(M, N);
    [edges, pdf_vals] = my_pdf(v, number_of_bins);
    
    stored_edges = [stored_edges, edges];
    stored_vals = [stored_vals, pdf_vals];
    
end

% Create a big figure with 3 subplots
figure;
for i = 1:3
    subplot(3, 1, i);
    bar(stored_edges{i}, stored_vals{i}, 'histc');
    xlabel('Sample Values');
    ylabel('Estimated PDF');
    title(['Estimated PDF for N = ', num2str(Ns(i))]);
    grid on;
end


%% Question 3

% generating a uniformly random signal
% mean from 0 to 500 is 0
N1 = 500;
v1 = rand(1,N1) - 0.5;
% mean from 500 to 1000 is 1
N2 = 500;
v2 = rand(1,N2);
% concatenate the two singals
v = [v1, v2];

my_pdf(v, 10);