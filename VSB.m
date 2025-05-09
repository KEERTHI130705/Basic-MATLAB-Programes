clc; clear; close all;
msg_freq = input('Enter message signal frequency (Hz): ');
car_freq = input('Enter carrier signal frequency (Hz): ');
msg_amp = input('Enter message signal amplitude: ');
car_amp = input('Enter carrier signal amplitude: ');
fs = 20 * car_freq;                       % Sampling frequency
t_end = 100 / car_freq;                   % Time duration for 100 carrier cycles
t = 0 : 1/fs : t_end;                     % Time vector
message = msg_amp * cos(2*pi*msg_freq*t);              % Message signal
carrier = car_amp * cos(2*pi*car_freq*t);              % Carrier signal
dsbsc = message .* carrier;                            % DSB-SC signal

%--- Create Vestigial Sideband Filter (simple LPF) ---
% We'll create a filter that suppresses part of one sideband
N = length(dsbsc);
f_axis = linspace(-fs/2, fs/2, N);                     % Frequency axis
H = zeros(1, N);                                       % Frequency filter

% Design a basic VSB filter:
% - Fully pass the upper sideband
% - Suppress the lower sideband partially (vestige remains)
upper_cutoff = car_freq + msg_freq;
lower_cutoff = car_freq - msg_freq/2;

% Pass upper sideband (fc to fc+fm)
H(f_axis > car_freq & f_axis < upper_cutoff) = 1;

% Vestigial portion (fc-fm/2 to fc)
H(f_axis > lower_cutoff & f_axis <= car_freq) = linspace(0, 1, sum(f_axis > lower_cutoff & f_axis <= car_freq));

% Apply the same filter symmetrically for negative frequencies
H = H + fliplr(H);

%--- Apply VSB Filter in Frequency Domain ---
DSB_FFT = fft(dsbsc, N);
DSB_FFT_shifted = fftshift(DSB_FFT);
VSB_spectrum = DSB_FFT_shifted .* H;                  % Apply VSB filter
vsb_time_signal = ifft(ifftshift(VSB_spectrum), N);  
subplot(4,1,1);
plot(t, message);
title('Message Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,2);
plot(t, dsbsc);
title('DSB-SC Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,3);
plot(t, real(vsb_time_signal));
title('VSB Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,4);
plot(f_axis, abs(VSB_spectrum)/N);
title('VSB Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
