%Assignment 1 - Basic Signal Processing with Matlab
%exercise 4:
%.m file zero_pad
%Student name: Paul Doherty
%Student Number: 10387129

close all               %command to close all figures before running code

fs=1024;                %define variable fs to set sampling frequency to 1024Hz
f=330.5;                %define variable f to set frequency to 256Hz
N=256;                  %define variable N to sample 256 samples of sine wave
k=[0:N-1];              %define variable k to create vector to hold samples 
A=5.0;                  %define variable A to set amplitude to 5.0
x=A*sin(2*pi*(f/fs)*k); %creates sinewave and assigns it variable x
X=fft(x)/(N/2);               %computes fft of x and assigns it to variable X
Xshift=fftshift(X)      %computes fftshift of X and assigns it to variable Xshift
freq = [-(N/2):(N/2)-1]*(fs/N); %scales the X-axis appropiately to frequency
plot(freq, abs(Xshift),'.')     %plots discrete points of the magnitude of Xshift
grid on                         %command to turn on grid
xlabel('Frequency(Hz)')         %labels x-axis 
ylabel('Amplitude')             %labels y-axis
title('Magnitude of FFT')       %labels title of graph

figure;                         %allows next figure to be printed to screen whilst 
                                %holding previous figures on screen


                                 
%Zero padding

Nnew=2048;                                 %define variable Nnew to sample zero padded sine wave
freq1 = [-(Nnew/2):(Nnew/2)-1]*(fs/Nnew);  %scales the X-axis appropiately to frequency for zero padding
padx = [x, (zeros(1,2048- N))];           %creates  zero padded vector of signal x and assigns it to variable padx
Y=fft(padx)/(N/2);                               %computes FFT of padx and assigns it variable Y
Yshift=fftshift(Y);                        %computes fftshift of Y and assigns it to variable Yshift
plot(freq1,abs(Yshift),'r')                %plots magnitude of Yshift
grid on                                    %command to turn on grid
title('Magnitude of zero padded fft')      %labels title of graph
xlabel('Frequency(Hz)')                    %labels x-axis
ylabel('Amplitude')                        %labels y-axis
legend('magnitude')

figure;

hold on                          %tells Matlab to hold figure so next plot can be 
                                 %added to same figure
plot(freq, abs(Xshift),'.')
plot(freq1,abs(Yshift),'r') 
title('Magnitude of original and zero padded fft')      %labels title of graph
xlabel('Frequency(Hz)')                    %labels x-axis
ylabel('Amplitude')                        %labels y-axis
legend('original','zero padded')           %creates legend

                                 