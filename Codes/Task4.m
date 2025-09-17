% Task 4
close all; 
clear all; 
clc;

b=3;                            % Number of bits.
N=120;                          % Number of samples in final signal.
n=0:(N-1);                      % Index
f = 1;                          % frequency in Hz

% Create the input data sequence.
x=sin(2*pi*f*n/N);

% Signal is restricted to between -1 and +1.
x(x>=1)=(1-eps);                % Make  signal from -1 to just less than 1.
x(x<-1)=-1;

% Quantize a signal to "b" bits.  
xq=floor((x+1)*2^(b-1));        % Signal is one of 2^b int values (0 to 2^b-1)
  
%  Encoding Process
figure
code=dec2bin(xq,'left-msb');             % Convert decimal to binary

% Rewrite the following codes %
k=1;
for i=1:N
    for j=1:b
        coded(k)=code(i,j);            % convert code matrix to a coded row vector
        j=j+1;
        k=k+1;
    end
    i=i+1;
end
% Donot change codes below %

 subplot(3,1,1); grid on;
 plot(x);
 title('Original Signal');
 ylabel('Amplitude');
 xlabel('Time');
 subplot(3,1,2)
 plot(xq);
 title('Quantized Signal');
 ylabel('Amplitude');
 xlabel('Time');
 subplot(3,1,3)
 stairs(coded);                                 % Display the encoded signal
 axis([0 length(coded) -0.2 1.2]);  
 title('Encoded Signal');
 ylabel('Amplitude');
 xlabel('Time');
 
