function h = myfir2(N, wc,ftype,window_type)
    n = 0:N;
    a=N/2;
    switch lower(ftype)
        case 'low'
            h= sinc(wc * (n-a)) * wc; 
        case 'high'
            h= sinc(wc * (n-a)) * wc;
            h = -h; 
            h(N/2 + 1) = h(N/2 + 1) + 1;
        case 'bandpass'
            h2=wc(2)*sinc(wc(2)*(n-a));
            h1=wc(1)*sinc(wc(1)*(n-a));
            h=-(h2-h1);
        case 'bandstop'
            h2=wc(2)*sinc(wc(2)*(n-a));
            h1=wc(1)*sinc(wc(1)*(n-a));
            h=-(h2-h1);
            h(N/2 + 1) = h(N/2 + 1) + 1;
    end
    switch lower(window_type)
        case 'rectangle'
            w=boxcar(N+1);
        case 'bartlett'
            w=bartlett(N+1);
        case 'hamming'
            w=hamming(N+1);
        case 'hanning'
            w=hann(N+1);
        case 'blackman'
            w=blackman(N+1);
    end
    h = h .* w'; 
end

clc;
clear all;
close all;
fc=input('Enter the cutoff frequency: ');
N=input('Enter order of filter: ');
Fs=20*fc;
wc=2*(fc/Fs);

h1=fir1(N,wc,hamming(N+1));
[H1,w]=freqz(h1,1);
H_mag1=abs(H1);
H_magnorm1=H_mag1/max(H_mag1);
subplot(211)
plot(w,20*log10(H_magnorm1))
title('LPF Inbuilt')


h2=myfir2(N,wc,'low',haMMing');
[H2,w]=freqz(h2,1);
H_mag2=abs(H2);
H_magnorm2=H_mag2/max(H_mag2);
subplot(212)
plot(w,20*log10(H_mag2))
title('LPF User defined')

error = norm(h1 - h2);
disp(['Error between inbuilt and user-defined filter: ', num2str(error)]);
