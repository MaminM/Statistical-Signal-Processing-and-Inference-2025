clc
clear all
close all

full_data = readmatrix('ecg_data.csv');
ecg_data = full_data(:, 2);
%%
% sampling freq is 500Hz

figure;
plot(ecg_data)
