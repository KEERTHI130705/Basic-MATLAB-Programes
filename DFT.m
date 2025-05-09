% DFT Program in MATLAB (without using fft)
clc;
clear;
close;

x = input('Enter the input sequence x[n]: ');
N = length(x); % Length of the input
X = zeros(1, N);%Initialize output

for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1j*2*pi*k*n/N);
    end
end
mag_X = abs(X);% Magnitude 
ph_X = angle(X);%Phase
disp('DFT of the input sequence is: ');
disp(X);
% Plotting
subplot(3,1,1);
stem(0:N-1, x);
title('Input Sequence x[n]');
xlabel('--->n');
ylabel('Amplitude');

subplot(3,1,2);
stem(0:N-1, mag_X);
title('Magnitude Spectrum |X[k]|');
xlabel('--->k');
ylabel('Magnitude');

subplot(3,1,3);
stem(0:N-1, ph_X);
title('Phase Spectrum ');
xlabel('--->k');
ylabel('Phase (radians)');
