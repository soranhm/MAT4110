% Convert the images to grey scale
% https://pixabay.com/en/board-chess-chessboard-black-white-157165/
im1 = rgb2gray(imread('chessboard.png'));
% https://pixabay.com/en/jellyfish-under-water-sea-ocean-698521/
im2 = rgb2gray(imread('jellyfish.jpg'));
% https://pixabay.com/en/new-york-city-skyline-nyc-690868/
im3 = rgb2gray(imread('new_york.jpg'));
% Convert to double between 0 and 1.
im1 = im2double(im1);
im2 = im2double(im2);
im3 = im2double(im3);

[u1,s_1,v1] = svd(im1);
[u2,s_2,v2] = svd(im2);
[u3,s_3,v3] = svd(im3);


%Plot of the log of the singular values
figure(4)
subplot(221)
semilogy(diag(s_1))
title('Chessboard')
ylabel('Log')
subplot(222)
semilogy(diag(s_2))
title('Jellyfish')
ylabel('Log')
subplot(223)
semilogy(diag(s_3))
title('New York')
ylabel('Log')


%Compressing
r1 = 2   % gives good approx for cheesboard 
r2 = 100 % gives good approx for jellyfish 
r3 = 600 % gives good approx for new york 

s1 = s_1; s2 = s_2; s3 = s_3;
s1(r1+1:end, :) = 0; s1(:,r1+1:end) = 0; % make the rest zero
s2(r2+1:end, :) = 0; s2(:,r2+1:end) = 0; % make the rest zero
s3(r3+1:end, :) = 0; s3(:,r3+1:end) = 0; % make the rest zero

D1 = u1*s1*v1';
D2 = u2*s2*v2';
D3 = u3*s3*v3';

imwrite(D1,'compressed_chessboard.png')
imwrite(D2,'compressed_jellyfish.jpg')
imwrite(D3,'compressed_new_york.jpg')


% Plot the images
figure(1)
subplot(121)
imshow(im1,'InitialMagnification',50)
title('Chessboard')
subplot(122)
imshow(D1,'InitialMagnification',50)
title('Compressed Chessboard, r = 2')

figure(2)
subplot(121)
imshow(im2,'InitialMagnification',50)
title('Jellyfish')
subplot(122)
imshow(D2,'InitialMagnification',50)
title('Compressed Jellyfish, r = 100')

figure(3)
subplot(121)
imshow(im3,'InitialMagnification',50)
title('New York')
subplot(122)
imshow(D3,'InitialMagnification',50)
title('Compressed  New York, r = 600')


% Compression ratio
[cn1,cm1] = size(D1); [ucn1,ucm1] = size(im1);
[cn2,cm2] = size(D2); [ucn2,ucm2] = size(im2);
[cn3,cm3] = size(D3); [ucn3,ucm3] = size(im3);
Compression_ratio1 = (ucn1 * ucm1)/(r1 * (cn1 + cm1 + 1))
Compression_ratio2 = (ucn2 * ucm2)/(r2 * (cn2 + cm2 + 2))
Compression_ratio3 = (ucn3 * ucm3)/(r3 * (cn3 + cm3 + 3))




