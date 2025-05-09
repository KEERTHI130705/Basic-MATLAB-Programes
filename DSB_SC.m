clc; clear; close all;

msg_freq = input('Enter message signal frequency (Hz): ');
car_freq = input('Enter carrier signal frequency (Hz): ');
msg_amp = input('Enter message signal amplitude: ');
car_amp = input('Enter carrier signal amplitude: ');

fs = 20 * car_freq;                    
t_end = 100 / car_freq;              
t = 0 : 1/fs : t_end;                % Time vector
message = msg_amp * cos(2*pi*msg_freq*t);       
carrier = car_amp * cos(2*pi*car_freq*t);        
dsbsc_signal = message .* carrier;                % DSB-SC signal


N = length(dsbsc_signal);
DSB_FFT = fft(dsbsc_signal, N);
DSB_FFT_shifted = fftshift(DSB_FFT);
DSB_spectrum = abs(DSB_FFT_shifted) / N;
f_axis = linspace(-fs/2, fs/2, N);

subplot(411);
plot(t, message);
title('Message Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(412);
plot(t, carrier);
title('Carrier Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(413);
plot(t, dsbsc_signal);
title('DSB-SC Signal');
xlabel('Time'); ylabel('Amplitude');

subplot(414);
plot(f_axis, DSB_spectrum);
title('Spectrum of DSB-SC Signal');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
