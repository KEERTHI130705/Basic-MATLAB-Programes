clc;
clear all;
close all;

d = input("Enter the digital signal bits [e.g. [1 0 1 1]]: ");
A = input("Enter the amplitude of Carrier signal: ");
Fc = input("Enter the frequency of Carrier signal (Hz): ");

Fs = 100 * Fc;          % Sampling frequency
Tb = 1;                 % Bit duration
Nb = length(d);         % Number of bits

t = 0 : 1/Fs : Nb*Tb - 1/Fs;  % Total time vector
dt = repelem(d, Fs*Tb);       % Repeat each bit to match time vector

c = A * cos(2 * pi * Fc * t); % Carrier signal
ASK = c .* dt;                % ASK signal

subplot(311)
plot(t, dt)
title("Digital Input Signal (Modulating signal)")
xlabel("Time (s)")
ylabel("Amplitude")
axis([0 max(t) -0.5 1.5])

subplot(312)
plot(t, c)
title("Carrier Signal")
xlabel("Time (s)")
ylabel("Amplitude")

subplot(313)
plot(t, ASK)
title("Amplitude Shift Keying Signal (Output)")
xlabel("Time (s)")
ylabel("Amplitude")
