function [edges, pdf_values] = my_pdf(data, number_of_bins)
    % Compute histogram manually
    edges = linspace(min(data), max(data), number_of_bins + 1);
    counts = zeros(1, length(edges));
    
    % Count occurrences in each bin
    for i = 1:length(data)
        for j = 1:length(edges)-1
            if data(i) >= edges(j) && data(i) < edges(j+1)
                counts(j) = counts(j) + 1;
                break;
            end
        end
    end
    
    % Normalize to get probability density function
    bin_width = edges(2) - edges(1);
    pdf_values = counts / (sum(counts) * bin_width);
    
    % Plot the estimated PDF
    figure;
    bar(edges, pdf_values, 'histc');
    xlabel('Sample Values');
    ylabel('Estimated PDF');
    title_ = sprintf('Estimated pdf: N = %d, %d bins', length(data), number_of_bins);
    title(title_);
    
    grid on;
end





% function [] = pdf(data, number_of_bins)
%     % Compute histogram
%     edges = linspace(min(data), max(data), number_of_bins + 1);
%     counts = histc(data, edges); % Count occurrences in each bin
% 
%     % Normalize to get probability density function
%     bin_width = edges(2) - edges(1);
%     pdf_values = counts / (sum(counts) * bin_width);
% 
%     % Plot the estimated PDF
%     figure;
%     bar(edges, pdf_values, 'histc');
%     xlabel('Sample Values');
%     ylabel('Estimated PDF');
%     title('Estimated Probability Density Function');
%     grid on;
% end


% function [] = pdf(data, number_of_bins)
%     hist(data, number_of_bins) %#ok<HIST>
% end
