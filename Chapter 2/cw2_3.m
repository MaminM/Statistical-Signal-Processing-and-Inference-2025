%% Question 1
clc
close all
clear all

K = 1000; % number of random coeffs
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
    
    % do majority vote on covergence
    converges = 0;
    TRIAL_COUNT = 50;
    THRESHOLD = (TRIAL_COUNT-1)/2;
    for TRIAL_ITER = 1:TRIAL_COUNT        
        % generate the signal
        % assume x(1) = randn; x(2) = randn
        % the choice of initial value may introduce a transient
        % this implies that we must consider stability of this transient
        if true
           x_initial = zeros(1,2); 
           title_str = 'x(1) = x(2) = 0'
        else
           x_initial = randn(1,2); 
           title_str = 'x(1) = x(2) = randn'
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

end


figure;
scatter(a2_converge, a1_converge, 'blue', 'o')
hold on
scatter(a2_diverge, a1_diverge, 'red', 'o')
scatter(a2_theory_conv, a1_theory_conv, 'blue', 'x')
scatter(a2_theory_div, a1_theory_div, 'red', 'x')
legend('Converge', 'Diverge', 'Theoretical Convergence', 'Theoretical Divergence')
title(['Measured Results: ',title_str])


figure;
scatter(a2_theory_conv, a1_theory_conv, 'blue', 'x')
hold on
scatter(a2_theory_div, a1_theory_div, 'red', 'x')
legend('Converge', 'Diverge')
title(['Theoretical Convergence Results: ',title_str])


% plot a figure for when the prediction didn't match the realisation
gray_hex = '#808080';
soft_blue_hex = '#87CEEB';
figure;
scatter(a2_err, a1_err, 100, '.', 'MarkerEdgeColor', gray_hex)
hold on
scatter(a2_correct, a1_correct, '.', 'MarkerEdgeColor', soft_blue_hex)
legend('Error', 'Correct')
legend('Converge', 'Diverge')
title(['Errors in convergence prediction: ',title_str])



