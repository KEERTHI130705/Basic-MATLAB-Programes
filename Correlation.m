function y = u_corr(x, h)
    if nargin == 2
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
    elseif nargin == 1
        N=length(x);
        outlen=N+N-1;
        xm1=[zeros(1,N-1),x];
        xm2=[x,zeros(1,N-1)];
        y=zeros(1,outlen);
        for i=1:outlen
             y(i)=xm1*xm2';
            xm2=circshift(xm2,1);
        end
    end
end

clc;
clear;
x = input('Enter input sequence: ');
i = input("Enter 1 for Auto Correlation \n 2 for Cross Correlation: \n");
switch(i)
    case 1
        y = u_corr(x);  
        disp('Auto Correlation of x[n] with user defined: ')
        disp(y)
        disp('Auto Correlation of x[n] with inbuilt: ')
        disp(xcorr(x))
    case 2
        h = input("Enter impulse sequence: ");
        y = u_corr(x,h);  
        disp('Cross Correlation of x[n] & h[n] with user defined: ')
        disp(y)
        disp('Cross Correlation of x[n] & h[n] with inbuilt: ')
        disp(xcorr(x,h))
end
