clc;
clear all;
close all;
i = input("Upsampling Factor: ");
n = 0:50;
x = sin(2*pi*0.031*n);
subplot(2,1,1)
stem(n, x)
title('Input Sequence')
xlabel('Time')
ylabel('Amplitude')
% Upsampling
y = zeros(1, i*length(x));
y(1:i:end) = x;
subplot(2,1,2)
stem(n, y(1:length(x)))
title(['Upsample by ', num2str(i), ' Sequence '])
xlabel('Time')
ylabel('Amplitude')
