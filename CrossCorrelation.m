function y=crossx(x,h)
   M = length(x);            % Length of input sequence x
   N = length(h);            % Length of impulse response h
   hm = [h, zeros(1,M-N)];   % Zero-pad h to match the length of x
   outlen = M + M - 1;       % Length of output correlation
   xm = [zeros(1,M-1), x];   % Zero-pad x with (M-1) zeros at the beginning
   hm = [hm, zeros(1,M-1)];  % Zero-pad h with (M-1) zeros at the end
   y = zeros(1,outlen);      % Initialize the output array
   for i = 1:outlen
       y(i) = xm * hm';        % Compute dot product
       hm = circshift(hm, 1);  % Circularly shift h by 1 to the right
   end
end

clc;
clear all;
close all;
x=input('Enter input sequence: ');
h=input('Enter Impulse sequence: ');
y=crossx(x,h);                 % Call the custom function
disp('Cross Correlation of x[n] and h[n] without inbuilt function')
disp(y)
disp('Cross Correlation of x[n] and h[n] with inbuilt function')
disp(xcorr(x,h))               % Compare with MATLAB inbuilt
M=length(x);
N=length(h);
outlen=M+M-1;
n1=1:M;
n2=1:N;
m=1:outlen;
subplot(311)
stem(n1,x)
title('Input sequence')
xlabel('Time');
ylabel('Amplitude');
subplot(312)
stem(n2,h)
title('Impulse sequence')
xlabel('Time');
ylabel('Amplitude');
subplot(313)
stem(m,y)
title('Cross Correlation sequence')
xlabel('Time');
ylabel('Amplitude');
