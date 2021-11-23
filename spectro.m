function [S] = spectro(X)
[m,n] = size(X);
S = zeros(m,n);
for i = 1 : m
    for j = 1 : n
        S(i,j) = (abs(X(i,j)).^2)/n;
    end
end