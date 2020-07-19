function B = CF(A)

[n,m] = size(A)
B = zeros(n,1)
B(1) = A

for i=2:n
    B(n) = B(n-1) - A(n,n)*A(:,n)*transpose(A(:,n))
end
end

    