%Assignment 1 - Basic Signal Processing with Matlab
%part 2
%.m file vector_processing
%Student name: Paul Doherty
%Student number: 10387129

f=2000;                        %define variable f to set frequency to 2kHz
fs=8000;                       %define variable fs to set sampling frequency to 8kHz
A= 5.0;                        %define variable A to set amplitude to 5.0

k=[0:8000-1];                  %variable to create vector to sample sinewave (time value)
x=A*sin(2*pi*(f/fs)*k);        %creates sinewave and assigns it variable x

plot(x)                             %plots sinewave
xlim([0 75])                        %limits graph to 75 samples
xlabel('Frequency(Hz)')             %label x axis
ylabel('amplitude')                 %label y axis
title('Sine wave - Amplitude Vs. Frequency(Hz)') %labels title
legend('sine wave');                %creates legend for graph

%Root mean square of vector x components
x1 = x.^2;                    %Term-wise squaring of vector x and assigning new values to vector variable x1

mean = sum(x1/8000)           %final step in root mean square formula to devide all 
                              %components by total number of terms and add
                              %them together and print value 'mean' to
                              %screeen
