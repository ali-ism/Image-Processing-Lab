clear all
close all
clc

%% 1
M = 256;
m = 64;
im = zeros(M,M);
im(M/2-m/2:M/2+m/2,M/2-m/2:M/2+m/2) = 1;
figure, imshow(im), title('Image')
figure, imshow(im,[0 255]) %image all black bcz 1 is close to 0 in gray level
title('Image in grayscale')

%% 2
clc
close all
imf = fft2(im);
figure, imshow(imf)
title('2DFT')
imf = fftshift(imf);
figure, imshow(imf)
title('Centralized 2DFT')
figure, imshow(abs(imf)) %abs bcz 2DFT is complex
title('Absolute Centralized 2DFT')

%% 3
% image can be rescaled by dividing by the maximum number, thus all values
% will be between 0 and 1
fftshow(imf)
title('Log Centralized Rescaled 2DFT')
fftshow(imf,'abs')
title('Abs Centralized Rescaled 2DFT')

%% 4
figure, mesh(abs(imf))

%% 5
clc
close all
ima = zeros(256,256);
%imb = zeros(256,256);
imc = zeros(256,256);
imd = zeros(256,256);
ime = eye(256,256);
ima(64:84,:) = 1;
imb = fliplr(ima');
imc(130:150,:) = 1;
imd(64:104,:) = 1;

%% 6
clc
close all
fftshow(fft2(ima)), title('Fourier a')
fftshow(fft2(imb)), title('Fourier b')
fftshow(fft2(imc)), title('Fourier c')
fftshow(fft2(imd)), title('Fourier d')
fftshow(fft2(ime)), title('Fourier e')

%% 9
clc
close all
clear all

im = checkerboard;
figure, imshow(im), title('Checkerboard Image')
imf = fft2(im);
imf = fftshift(imf);
fftshow(imf), title('Checkerboard Fourier')
mesh(abs(imf))