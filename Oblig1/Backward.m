 function [x]=Backward(A,b)
% Solves the upper triangular system of equations Ax = b % A input argument, square upper triangular matrix
% b input argument
% x solution
[n,m]=size(A); % finding the size of A 
if n ~= m
    disp('input is not a square matrix');
    return; 
end
if size(b,1)~= n
    disp('input dimensions do not match'); 
    return;
end
x = zeros(n,1); % initialise x to the same dimension
if abs(A(n,n)) > 1e-12 % not comparing to zero because of possible
                       % rounding errors
    x(n) = b(n)/A(n,n); % solve for the last element of x
else
    disp('input singular'); % A is singular if any of the diagonal 
                            % elements are zero
    return; 
end
for k=n:-1:1 % the loop considers one row after the other backwards 
    if abs(A(k,k))>1e-12 % not comparing to zero because of possible
                         % rounding errors
        temp = 0;
        for j=n:-1:k+1
            temp = temp + A(k,j) * x(j); % Multiply the elements of 
                                 % the k?th row of A after the
                                 % diagonal by theelements of x
                                 % already calculated
        end
        x(k) = (b(k)-temp)/A(k,k); % solve for the k?th element of x 
    else
        disp('input singular'); % A is singular if any of the diagonal 
                                % elements are zero
         return; 
    end
end