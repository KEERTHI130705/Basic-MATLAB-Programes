clc;
close all;
clear all;
t=0:0.001:1;
f=input("Enter the frequency: ");
type_wave = input("Enter the type: ");
if type_wave=="pulse"
    duty = input("Enter duty cycle(%): ");  
end

switch(lower(type_wave))
    case "sine"
        y = sin(2*pi*f*t);       %sine waveform
    case "square"
        y = square(2*pi*f*t);    %square waveform(50% duty cycle)
    case "triangle"
        y = sawtooth(2*pi*f*t, 0.5);     %triangle waveform
    case "sawtooth"
        y = sawtooth(2*pi*f*t);         %sawtooth waveform
    case "pulse"
        y = square(2*pi*f*t, duty);       %pulse waveform(<50% duty cycle)
end
plot(t,y)
title(type_wave + " Waveform")
xlabel("Time(s)")
ylabel("Amplitude")
