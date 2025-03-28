%% Question 1
clc
clear all
close all

load 'Chapter 4'\voice.mat


p=5;  %AR process order;
u=5; %adaptation gain
offset = 3.5e4;
e = e(offset:offset+1000);
offset = 3.8e4;
a = a(offset:offset+1000);
offset = 3.5e4;
s = s(offset:offset+1000);
offset = 3e4;
t = t(offset:offset+1000);
offset = 4e4;
x = x(offset:offset+1000);


[ y, ap, error ] = arlms( a', u, p ); 
L = length(ap);
%plot coeficents evolution
figure
plot(1:L,ap.','LineWidth',2)
grid on;
xlim([1 L]);
title('Weights evolution')
legend('a_1', 'a_2','Location','southeast')
xlabel('Iteration')
ylabel('Weights')

%plot prediction and input
figure
hold on
plot(a);
plot(y, 'r');
legend('Input', 'Prediction','Location','southeast')
hold off
title('Prediction')
xlabel('Iteration')
ylabel('Amplitude')

%plot error
figure
plot(1:length(e), e.^2);
ylim([0 0.01]);
title('Error evolution')
xlabel('Iteration')
ylabel('Square Error')


%% model predictions
clc
clear all
close all

load 'Chapter 4'\voice.mat


p=5;  %AR process order;
u=5; %adaptation gain
order = 10; % Filter order
gain = 0.5;

offset = 3.5e4;
e = e(offset:offset+1000);
offset = 3.8e4;
a = a(offset:offset+1000);
offset = 3.5e4;
s = s(offset:offset+1000);
offset = 3e4;
t = t(offset:offset+1000);
offset = 4e4;
x = x(offset:offset+1000);


e_voice = e(1:N);
e_shift = [0; e_voice(1:N-1)];

a_voice = a(1:N);
a_shift = [0; a_voice(1:N-1)];

s_voice = s(1:N);
s_shift = [0; s_voice(1:N-1)];

t_voice = t(1:N);
t_shift = [0; t_voice(1:N-1)];

x_voice = x(1:N);
x_shift = [0; x_voice(1:N-1)];

[e_predict,ee,e_w] = nlms(e_shift, e_voice, gain, order); 
[a_predict,ae,a_w] = nlms(a_shift, a_voice, gain, order); 
[s_predict,se,s_w] = nlms(s_shift, s_voice, gain, order); 
[t_predict,te,t_w] = nlms(t_shift, t_voice, gain, order); 
[x_predict,xe,x_w] = nlms(x_shift, x_voice, gain, order); 


[MDL_e,AIC_e] = MDL_and_AIC(e_predict,100);
[MDL_a,AIC_a] = MDL_and_AIC(a_predict,100);
[MDL_s,AIC_s] = MDL_and_AIC(s_predict,100);
[MDL_t,AIC_t] = MDL_and_AIC(t_predict,100);
[MDL_x,AIC_x] = MDL_and_AIC(x_predict,100);

% The optimal model order is the minimum value in the matrix
[~,IMDL_e] = min(MDL_e);
[~,IMDL_a] = min(MDL_a);
[~,IMDL_s] = min(MDL_s);
[~,IMDL_t] = min(MDL_t);
[~,IMDL_x] = min(MDL_x);

[~,IAIC_e] = min(AIC_e);
[~,IAIC_a] = min(AIC_a);
[~,IAIC_s] = min(AIC_s);
[~,IAIC_t] = min(AIC_t);
[~,IAIC_x] = min(AIC_x);

fprintf('The optimal model order for the letters are: \n')
fprintf('e_MDL = %d\n',IMDL_e)
fprintf('e_AIC = %d\n',IAIC_e)
fprintf('a_MDL = %d\n',IMDL_a)
fprintf('a_AIC = %d\n',IAIC_a)
fprintf('s_MDL = %d\n',IMDL_s)
fprintf('s_AIC = %d\n',IAIC_s)
fprintf('t_MDL = %d\n',IMDL_t)
fprintf('t_AIC = %d\n',IAIC_t)
fprintf('x_MDL = %d\n',IMDL_x)
fprintf('x_AIC = %d\n',IAIC_x)

% % Prediction gains:
% fprintf('Rp for "e" = %f\n',Rp(e,ee))
% fprintf('Rp for "a" = %f\n',Rp(a,ae))
% fprintf('Rp for "s" = %f\n',Rp(s,se))
% fprintf('Rp for "t" = %f\n',Rp(t,te))
% fprintf('Rp for "x" = %f\n',Rp(x,xe))


% Plots
figure(1);
clf; % Clear the figure before plotting

% e
subplot(1, 5, 1);
hold on;
for i = 1:length(e_w(:, 1))
    plot(e_w(i, :));
end
hold off;
title('Letter "e"');
xlabel('Sample');
ylabel('Coefficients');
grid on;
grid minor;

% a
subplot(1, 5, 2);
hold on;
for i = 1:length(a_w(:, 1))
    plot(a_w(i, :));
end
hold off;
title('Letter "a"');
xlabel('Sample');
ylabel('Coefficients');
grid on;
grid minor;

% s
subplot(1, 5, 3);
hold on;
for i = 1:length(s_w(:, 1))
    plot(s_w(i, :));
end
hold off;
title('Letter "s"');
xlabel('Sample');
ylabel('Coefficients');
grid on;
grid minor;

% t
subplot(1, 5, 4);
hold on;
for i = 1:length(t_w(:, 1))
    plot(t_w(i, :));
end
hold off;
title('Letter "t"');
xlabel('Sample');
ylabel('Coefficients');
grid on;
grid minor;

% x
subplot(1, 5, 5);
hold on;
for i = 1:length(x_w(:, 1))
    plot(x_w(i, :));
end
hold off;
title('Letter "x"');
xlabel('Sample');
ylabel('Coefficients');
grid on;
grid minor;

%%  Question 2
close all
clear all
clc

load 'Chapter 4'\voice.mat

step = 5;
offsetE = 3.5e4;
eSeg = e(offsetE:offsetE+1000);
offsetA = 3.8e4;
aSeg = a(offsetA:offsetA+1000);
offsetS = 3.5e4;
sSeg = s(offsetS:offsetS+1000);
offsetT = 3e4;
tSeg = t(offsetT:offsetT+1000);
offsetX = 4e4;
xSeg = x(offsetX:offsetX+1000);
gainE = []; gainA = []; gainS = []; gainT = []; gainX = [];
for order = [1:1:30]
    [~, ~, err] = arlms(eSeg', step, order); 
    gainE = [gainE, prediction_gain(eSeg, err)];
    [~, ~, err] = arlms(aSeg', step, order); 
    gainA = [gainA, prediction_gain(aSeg, err)];
    [~, ~, err] = arlms(sSeg', step, order); 
    gainS = [gainS, prediction_gain(aSeg, err)];
    [~, ~, err] = arlms(tSeg', step, order); 
    gainT = [gainT, prediction_gain(aSeg, err)];
    [~, ~, err] = arlms(xSeg', step, order); 
    gainX = [gainX, prediction_gain(aSeg, err)];
end
hold on
plot(gainE, 'LineWidth', 2, 'Color', 'b'); 
plot(gainA, 'LineWidth', 2, 'Color', 'r'); 
plot(gainS, 'LineWidth', 2, 'Color', 'g'); 
plot(gainT, 'LineWidth', 2, 'Color', 'm'); 
plot(gainX, 'LineWidth', 2, 'Color', 'k'); 
hold off;
title('Prediction gain versus filter order');
xlabel('Order');
ylabel('Prediction gain');
legend('e', 'a', 's', 't', 'x');

%% Question 3
close all
clear all
clc

load 'Chapter 4'\voice.mat
fs = 44100;

%change the sampling rate to 16000Hz
[P,Q] = rat(16000/fs);
e_new = resample(e,P,Q);
a_new = resample(a,P,Q);
s_new = resample(s,P,Q);
t_new = resample(t,P,Q);
x_new = resample(x,P,Q);
u=5; %adaptation gain
offset = 1.1e4;
e_new = e_new(offset:offset+1000);
offset = 1.38e4;
a_new = a_new(offset:offset+1000);
offset = 1.27e4;
s_new = s_new(offset:offset+1000);
offset = 1.09e4;
t_new = t_new(offset:offset+1000);
offset = 1.45e4;
x_new = x_new(offset:offset+1000);
R=[];R1=[];R2=[];R3=[];R4=[];
for p=[1:1:30]
    [ y, ap, error ] = arlms( e_new', u, p ); 
    temp = prediction_gain(e,error);
    R = [R, temp];
    [ y, ap, error ] = arlms( a_new', u, p ); 
    temp = prediction_gain(a,error);
    R1 = [R1, temp];
    [ y, ap, error ] = arlms( s_new', u, p ); 
    temp = prediction_gain(a,error);
    R2 = [R2, temp];
    [ y, ap, error ] = arlms( t_new', u, p ); 
    temp = prediction_gain(a,error);
    R3 = [R3, temp];
    [ y, ap, error ] = arlms( x_new', u, p ); 
    temp = prediction_gain(a,error);
    R4 = [R4, temp];
end
hold on
plot(R, 'LineWidth', 2, 'Color', 'b'); 
plot(R1, 'LineWidth', 2, 'Color', 'r'); 
plot(R2, 'LineWidth', 2, 'Color', 'g'); 
plot(R3, 'LineWidth', 2, 'Color', 'm'); 
plot(R4, 'LineWidth', 2, 'Color', 'k'); 
hold off;
title('Prediction gain versus filter order with fs = 16000Hz');
xlabel('Order');
ylabel('Prediction gain');
legend('e', 'a', 's', 't', 'x');