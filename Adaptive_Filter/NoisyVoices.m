%Simulation of an Adaptive Filter Used for System Identification

clc
clear all
close all


%Read in Wav
[Y,Fs,Nbits] = wavread('noisy_voices');

%Input Parameters
alpha = 0.1;                   %Step size for LMS algorithm
nrun = length(Y);                   %No of samples used for simulation
p = 20;                        %length of adaptive filter
nwin = 200;                     %width of window for estimating MSE
u = zeros(1,5);

%Initialisations
yvec = zeros(1,nrun);   %For storing system output samples
xvec = zeros(1,nrun);   %For storing system input samples
c = zeros(1,p);         %Coefficients of adaptive filter
csr = zeros(1,p);       %Adaptive filter shift register
win = zeros(1,nwin);    %Stores nwin most recent squared errors
mse = zeros(1,nrun);    %Stores mean squared error
evec = zeros(1,nrun);


for k = (1:nrun)
    x = Y(k);

%The simulation
    csr = [Y(k) csr(1:end-1)];       %same sample goes into adaptive filter
    y = Y(k);                      %Output of unknown system
    z = csr*c';                    %Output of adaptive filter
    e = z - x;                   %Error
    win = [e^2 win(1:end-1)];   %Store most recent squared error
    mse(k) = sum(win)/nwin;     %Estimate mean squared error
    
    c = c - alpha*e*csr;        %LMS update
    evec(k) = e;                %Store output broadband signal
    yvec(k) = y;                %store system output sample
    zvec(k) = z;
end

 
% %Analysis
% %freqz(h)
% figure
% pwelch(xvec)
% figure
% pwelch(yvec)
% figure
% plot(10*log10(mse))        %Plot 10*log of MSE
% subplot(2,1,1)
% pwelch(evec, hann(256),[],[],Fs);
% subplot(2,1,2)
% spectrogram(evec,hann(256),[],[],'yaxis');
% 
