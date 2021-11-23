function [M,f] = My_Welch(x,Fe)
    X = [];
    M = length(x);
    n = floor(log2(M))-1;
    N = 2^n;
    K = floor(2*M/N)-1;
    c = 1;
    for k=1:K
        if (c+N-1 < M)
            Y = fftshift(fft(x(c:c+N-1),N));
            Y = abs(Y);
            N=length(x(c:c+N-1));
            P = (Y.^2)/N;
            X = [X;P];
            c = c + N;
        end
    end
    M = mean(X); 
    
    
    f = -1/2:1/(N-1):1/2;
    M=smooth(M);
end