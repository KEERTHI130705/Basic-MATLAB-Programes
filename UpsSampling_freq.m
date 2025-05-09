clc;
clear all;
close all;
freq=[0 0.45 0.5 1];
mag=[0 1 0 0];
x=fir2(99,freq,mag);
[xz,w]=freqz(x,1,512);
L=input('Enter the upsampling factor: ');
y=zeros(1,L*length(x));
y(1:L:length(y))=x;
[yz,w]=freqz(y,1,512);

subplot(211)
plot(w/pi,abs(xz));
xlabel('frequency')
ylabel('Magnitude')
title('Input sequence 100523735001')

subplot(212)
plot(w/pi,abs(yz));
xlabel('Frequency')
ylabel('Magnitude')
title('Output spectrum 100523735001')
