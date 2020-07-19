function [L,D] = Cholesky(A)
[n,m] = size(A);
L = zeros(n,n);
D = zeros(n,n);
B = A
for k=1:n
    L(:,k) = B(:,k)/B(k,k);
    D(k,k) = B(k,k);
    B = B - D(k,k)*L(:,k)*transpose(L(:,k))
end
