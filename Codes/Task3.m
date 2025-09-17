% Task 3

clear all; close all; clc;      % Remove all variables from previous programs
b = 3;                          % Quanitzation bits for simulated quantization
L = 2^(b-1);                    % Largest signed quantization level magnitude (used for normalization)

%  Read in wave file to be quanitzed (normalized amplitudes is part of the
%  wavread funtion)
filname = 'music.wav';  % load a sound file
                               
%  Read in signal, sampling frequency (fs) and bits per sample (B)
[s, fs] = audioread(filname); 
s = s/max(abs(s));  %  Set max amplitude to 1

% Perform the quantization through scaling to integer values corresponding
% to the simulated number of quantization bit and rounding off 
sq = (ceil(s*(L-0.5))-0.5)/L;
%  Compute error relative to original signal (note, vector nq is the quantization noise signal) 
nq = sq-s;
%  compute mean square error
nmse = sum((nq).^2)/sum(s.^2)

%  Concatenate sounds into one vector to hear one after the 
%  other with a little pause/silence between them
stest = [s; zeros(round(fs*.1),1); sq];
sound(stest,fs)


% Plot the average spectra, called power spectral density (PSD), of the original
% and simulated quantized sound
wlen = 512;  %  Window length in samples for extracting data for FFT magnitude computation
olap = fix(wlen/2); % Number of samples (overlap) between sucessive windows
nfft = 2*wlen;  %  Number of FFT points (achieved through zero padding if longer than WLEN)
[ps,f] = pwelch(s,hamming(wlen),olap,nfft,fs);  % Compute PSD of original 
[psq,fq] = pwelch(sq,hamming(wlen),olap,nfft,fs); % Compute PSD of quantized
%  Plot both spectra for comparison
plot(f,10*log10(ps*fs/wlen),'--r',fq,10*log10(psq*fs/wlen),':k', 'LineWidth', 2)
xlabel('Hz')
ylabel('dB')
legend('Original signal','Quantized signal');
title(['Quantized with ' int2str(b) ' bits, mse = ' num2str(nmse)])