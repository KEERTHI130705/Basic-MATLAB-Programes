clc;
clear all;
close all;
fp=input('Enter the pass band edge frequency: ');
fs=input('Enter the stop band edge frequency: ');
rp=input('Enter ripples in pass band: ');
rs=input('Enter the ripples in stop band: ');
Fs=20*fs;
wp=2*(fp/Fs);
ws=2*(fs/Fs);
[N,wc]=buttord(wp,ws,rp,rs);
[a,b]=butter(N,wc,'high');
[H,w]=freqz(a,b);
H_mag=abs(H);
H_phase=angle(H);
H_norm=H_mag/max(H_mag);
subplot(2,1,1)
plot((w*Fs)/(pi*2), 20*log10(H_norm))  
title('High pass Normalized Magnitude Response');
xlabel('Frequency (Hz/sample)');
ylabel('Normalized Magnitude');

subplot(2,1,2)
plot((w*Fs)/(pi*2), H_phase)            
title('High pass Phase Response');
xlabel('Frequency (Hz/sample)');
ylabel('Phase (radians)');
