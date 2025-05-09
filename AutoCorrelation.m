clc;
clear all;
close all;
x=input('enter the input sequence');


y1=xcorr(x);
 
M=length(x);

OutputLen=M+M-1;
xm=[zeros(1,M-1),x];
x2=[x,zeros(1,M-1)];

for i=1:OutputLen
    x3=[zeros(1,i-1),x2(1:OutputLen-i+1)];
    y(i)=xm*x3';
    
end
nx=1:M;

ny=1:OutputLen;
subplot(211)
stem(nx,x)
title('auto-correlation input sequence')
xlabel('time')
ylabel('amplitude')


subplot(212)
stem(ny,y)
title('output sequence')
xlabel('time')
ylabel('amplitude')
