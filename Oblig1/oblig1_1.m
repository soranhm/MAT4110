function [y,f,f_derv] = oblig1_1(E,y_oppg,A,x,m)
if E == 1 % calculating 1) with QR
    [Q,R] = qr(A);
    R1 = R(1:m,:); 
    b_1 = inv(Q)*y_oppg';
    b = Backward(R1,b_1(1:m,:)); % constants
    if m == 3 
        y = b(1) + x.*b(2) + x.^2*b(3) ;
    elseif m == 8
        y = b(1) + x.*b(2) + x.^2*b(3) + x.^3*b(4) + x.^4*b(5) +  x.^5*b(6) +  x.^6*b(7) + x.^7*b(8);
    end
    
    f = b(1) + x.*b(2) + x.^2*b(3);
    f_derv = b(2) + 2*x.*b(3);
elseif E == 2  % calculating 1) with Cholesky
    B = transpose(A)*A;
    [L,D] = Cholesky(B);
    b_f=A'*y_oppg';
    b = Forward(B,b_f);
    if m == 3 
        y = b(1) + x.*b(2) + x.^2*b(3) ;
    elseif m ==8
        y = b(1) + x.*b(2) + x.^2*b(3) + x.^3*b(4) + x.^4*b(5) +  x.^5*b(6) +  x.^6*b(7) + x.^7*b(8);
    end
    % to find K
    f = b(1) + x.*b(2) + x.^2*b(3);
    f_derv = b(2) + 2*x.*b(3);

end
end