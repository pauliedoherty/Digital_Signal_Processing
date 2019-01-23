%Assignment 1 - Basic Signal Processing with Matlab
%part 1:
%.m file sample_by_sample
%Student name: Paul Doherty
%Student Numbe: 10387129

%part (a)
f = 2000;                 %define variable f to set frequency to 2kHz
fs = 8000;                %define variable fs to set sampling frequency to 8kHz
A = 5.0;                  %define variable A to set amplitude to 5.0


%initiate for loop to construct 8000 samples of a sinewave of called x,
%with amplitude 5.0, frequency 2kHz and sampled at 8kHz

for k = [0:8000-1]                  %variable to create vector to sample sinewave (time value)
    x(k+1)=A*sin(2*pi*(f/fs)*k);    %creates sinewave and assigns it variable x
end                                 %end for loop
plot(x)                             %plots sinewave
xlim([0 75])                        %limits graph to 75 samples
xlabel('Frequency(Hz)')             %label x axis
ylabel('amplitude')                 %label y axis
title('Sine wave - Amplitude Vs. Frequency(Hz)') %labels title
legend('sine wave');                %creates legend for graph

%part (b)
%code  to calculate the mean squared value of x
sum = 0;                    %declare variable sum to hold sum of values of x
                            %and assign it an initial value of '0'
%for loop to evaluate sum of x
for k = [0:8000-1];     %variable to create vector to sample sinewave (time value)
    x(k+1) = A*sin(2*pi*(f/fs)*k);   %creates sinewave and assigns it variable x
    sum = sum + (x(k+1)^2);          %code to sum all components of x 
end                                  %end for loop

mean = sum/8000                      %code to get root mean square value of vector x 
                                     %and output answer mean
