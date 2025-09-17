%% Task 1
clear all;
clc;
close all;

figure(1);
clf;

f=[1 2 4];                      % frequency [Hz]

for i=1:length(f)               % generate the three sinusoid signals
    subplot(length(f),1,i)      % show them in 3 sub-plots
    t=(0:1/(f(i)*100):1);       % define the time support
    a=1;                        % amplitude [V]
    phi=0;                      % phase
    y=a*sin(2*pi*f(i)*t+phi);   % define the sinusoid
    plot(t,y)
    plot_title = ['frequency ' num2str(f(i)) 'Hz'];
    title(plot_title);

end
xlabel('time(s)')

Fs = 20;                         % sampling frequency 
figure(2);
clf;
dt = 1/Fs;
for i=1:length(f)
    subplot(length(f),1,i)
    t=(0:dt:1);
    a=1;                        %amplitude [V]
    phi=0;                      %phase
    y=a*sin(2*pi*f(i)*t+phi);
    stem(t, y)
    plot_title = ['frequency ' num2str(f(i)) 'Hz'];
    title(plot_title);
end
xlabel('samples')

