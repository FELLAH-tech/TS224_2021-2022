clear 
close all
clc


%% 
fmin = -100;
fmax = 100;
Fe = 1000; 
Fs = 1000;
te = 1/Fe;
Nfft = 512;
window_duration = 4;
N = window_duration*Fs;
d = 10;
w1 = hamming(N);
Nb = 1e4;

t=0:te:1;
b = randi([0,1],1,Nb);
%%---------------------------Spectrogram------------------------------------
        
        [x1, f1, t1] = stft(b, w1, d, Nfft, Fs);
        S1 = spectro(x1);
        
        imagesc(t1,f1, 10*log10(S1));
        h = colorbar;
        ylabel(h, 'Power/Frequency(dB/Hz)')
        
        xlabel('time(s)');
        ylabel('Frequency(Hz)');
        set(gca,'YDir','normal');
%% Resultats
[X, f] = My_Welch(b, Nfft, Fe);

figure,

plot(f,X);
grid on;
