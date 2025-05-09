clc;
clear;
close all;

n=0:49; % Time vector for 50 samples
m=0:50*3-1; % Time vector for 150 samples
x=sin(2*pi*0.031*m); % Original signal
y=x(1:3:length(x)); % Downsampling of x by factor of 3

% Plot the first 50 samples of the original oversampled signal
subplot(211)
stem(n,x(1:50))
axis([0,50,-1.2,1.2])
title('Input Sequence')
xlabel('Time')
ylabel('Amplitude')

% Plot the downsampled signal using the same x-axis values
subplot(212)
stem(n,y) 
axis([0,50,-1.2,1.2])
title('Down Sampled by 3')
xlabel('Time')
ylabel('Amplitude')
