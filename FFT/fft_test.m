%Assignment 1 - Basic Signal Processing with Matlab
%Exercise 3:
%.m file fft_test
%Student name: Paul Doherty
%Student Number: 10387129

close all                        %command to close all figures before running code

f = 2000;                        %define variable f to set frequency to 2kHz
fs = 8000;                       %define variable fs to set sampling frequency to 8kHz
A = 5.0;                         %define variable A to set amplitude to 5.0
k = [0:128-1];                   %variable to create vector to sample sinewave (time value)
x = A*sin(2*pi*(f/fs)*k);        %creates sinewave and assigns it variable x
N=128;
freq = [-(N/2):(N/2)-1]*(fs/N);  %scales the X-axis appropiately to frequency
plot(freq,x)
xlabel('Time(s)')                                %labels x axis
ylabel('amplitude')                              %labels y axis
title('x Sine wave - Amplitude Vs. Time(s)')      %labels title
legend('sine wave');                             %creates legend for graph

figure;                          %allows next figure to be printed to screen whilst holding previous figures on screen

X = fft(x)/(N/2);                 %computes fast fourier transform (fft) of x and assigns it to variable X
X(1:10)                          %prints first ten comonents of X to screen
Xshift = fftshift(X);            %Gets fftshift of X and assigns it to variable Xshift

hold on                                 %tells Matlab to hold figure so next plot can be added to same figure
plot(freq,imag(Xshift),'r')             %plots imaginary values only of 'Xshift' in a red colour
plot(freq,real(Xshift))                 %plots real values only of 'Xshift'
grid on                                 %command to turn on grid
xlabel('Frequency(Hz)')                 %labels x axis
ylabel('amplitude')                     %labels y axis
title('X Sine wave (fftshift)- Amplitude Vs. Frequency(Hz)') %labels title
legend('imaginary','real');             %creates legend for graph

figure;

hold on
plot(freq,imag(X),'r')                  %plots imaginary values only of 'X' in a red colour
plot(freq,real(Xshift))                 %plots real values only of 'Xshift'
grid on                                 %command to turn on grid
xlabel('Frequency(Hz)')                 %labels x axis
ylabel('amplitude')                     %labels y axis
title('X Sine wave (fftshift(real) fft(imaginary))- Amplitude Vs. Frequency(Hz)') %labels title
legend('imaginary','real');             %creates legend for graph


figure;

plot(freq,abs(Xshift))              %plots magnitude of 'X' 
grid on                             %command to turn on grid
xlabel('Frequency(Hz)')             %labels x axis
ylabel('amplitude')                 %labels y axis
title('X Sine wave Magnitude - Amplitude Vs. Frequency(Hz)') %label title for graph
legend('Amplitude');                %creates legend for graph