clc;
clear all;
close all;

d = input("Enter the digital signal bits [e.g. [1 0 1 1]]: ");
A = input("Enter the amplitude of Carrier wave (e.g. 2): ");
fc = input("Enter the carrier frequency (Hz): ");

df = 5;                        % Frequency deviation (±2 Hz)
fH = fc + df;                  % Frequency for bit '1'
fL = fc - df;                  % Frequency for bit '0'

Fs = 100 * fH;                 % Sampling frequency
Tb = 1;                        % Bit duration
Nb = length(d);                % Number of bits

t = 0:1/Fs:Nb*Tb - 1/Fs;       % Time vector for entire signal
FSK = zeros(1, length(t)); % Preallocate FSK signal

c = A * cos(2 * pi * fc * t);

for i = 1:Nb
    idx = (i-1)*Fs*Tb + 1 : i*Fs*Tb;
    if d(i) == 1
        FSK(idx) = A * cos(2*pi*fH*t(idx));
    else
        FSK(idx) = A * cos(2*pi*fL*t(idx));
    end
end

subplot(311)
plot(t,repelem(d, Fs*Tb))
title("Digital Input Signal")
xlabel("Time (s)")
ylabel("Amplitude")
axis([0 max(t) -0.5 1.5])

subplot(312)
plot(t, c)
title("Carrier Signal")
xlabel("Time (s)")
ylabel("Amplitude")

subplot(313)
plot(t, FSK)
title("Frequency Shift Keying Signal (FSK Output)")
xlabel("Time (s)")
ylabel("Amplitude")
