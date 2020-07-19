% Given values
n = 30; m1 = 3; m2 = 8;
start = -2;
stop = 2;
eps = 1;
rng(1);
x = linspace(start,stop,n);

%calculating two A corresponding to m's
A1 = zeros(n,m1);
for i=1:n
    for j=1:m1
        A1(i,j) = x(i)^(j-1);
    end
end

A2 = zeros(n,m2);
for i=1:n
    for j=1:m2
        A2(i,j) = x(i)^(j-1);
    end
end


r = rand(1,n)*eps;
y1 = x.*(cos(r+0.5*x.^3)+sin(0.5*x.^3));
y2 = 4*x.^5 - 5*x.^4 - 20*x.^3 + 10*x.^2 + 40*x + 10 + r;

% getting out the diffrent values from the function
[y_b1,f_b1,f_b1_derv] = oblig1_1(1,y1 ,A1,x,m1); % Backward , y1, m = 3
[y_b2,f_b2,f_b2_derv] = oblig1_1(1,y1 ,A2,x,m2); % Backward , y1, m = 8
[y_b3,f_b3,f_b3_derv] = oblig1_1(1,y2 ,A1,x,m1); % Backward , y2, m = 3
[y_b4,f_b4,f_b4_derv] = oblig1_1(1,y2 ,A2,x,m2); % Backward , y2, m = 8

% Ploting
figure(1)
suptitle('Backward')
subplot(221)
plot(x,y1,'o',x,y_b1,'r');
title('m = 3')
ylabel('First y')
subplot(222)
plot(x,y1,'o',x,y_b2,'r');
title('m = 8')
subplot(223)
plot(x,y2,'o',x,y_b3,'r');
title('m = 3')
ylabel('Second y')
subplot(224)
plot(x,y2,'o',x,y_b4,'r');
title('m = 8')...



[y_b1,f_f1,f_f1_derv] = oblig1_1(2,y1 ,A1,x,m1); % Forward , y1, m = 3
[y_f2,f_f2,f_f2_derv] = oblig1_1(2,y1 ,A2,x,m2); % Forward , y1, m = 8
[y_f3,f_f3,f_f3_derv] = oblig1_1(2,y2 ,A1,x,m1); % Forward , y2, m = 3
[y_f4,f_f4,f_f4_derv] = oblig1_1(2,y2 ,A2,x,m2); % Forward , y2, m = 8

figure(2)
suptitle('Forward')
subplot(221)
plot(x,y1,'o',x,y_f1,'r');
title('m = 3')
ylabel('First y')
subplot(222)
plot(x,y1,'o',x,y_f2,'r');
title('m = 8')
subplot(223)
plot(x,y2,'o',x,y_f3,'r');
title('m = 3')
ylabel('Second y')
subplot(224)
plot(x,y2,'o',x,y_f4,'r');
title('m = 8') 

% Calculating K
K_b1 = abs((x.*f_b1_derv)/f_b1)
K_b2 = abs((x.*f_b3_derv)/f_b3)
K_f1 = abs((x.*f_f1_derv)/f_f1)
K_f2 = abs((x.*f_f3_derv)/f_f3)