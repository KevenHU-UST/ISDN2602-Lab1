% Task 2
close all; 
clear all; 

b=5;                            % Number of bits.
N=120;                          % Number of samples in final signal.
n=0:(N-1);                      % Index
f = 2;                          % frequency in Hz

% Create the input data sequence.
x=sin(2*pi*f*n/N);

% Signal is restricted to between -1 and +1.
x(x>=1)=(1-eps);                % Make signal from -1 to just less than 1.
x(x<-1)=-1;

% Quantize a signal to "b" bits.
xq=floor((x+1)*2^(b-1));        % Quantize signal to one of 2^b int values
xq=xq/(2^(b-1));                % Convert quantized values 
xq=xq-1+1/2^b;                  % Shift signal down 

xe=x-xq;                        % Quantization error
errorStd = std(xe)

subplot(3,1,1);
stem(x,'b');
legend('Original signal');
title(sprintf('Signal quantized with %g bits',b));
subplot(3,1,2);
stem(xq,'r');
legend('quantized signal');
subplot(3,1,3);
stem(xe,'g');
legend('error','Location','Southeast')
