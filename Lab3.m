%% Part I
clear all
close all
clc

i = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\FiltIm.jpg');
figure, imshow(i), title('FiltIm')

fi = fftshift(fft2(i));
fftshow(fi), title('FT')

ha = fspecial('gaussian',size(i),30);
h2 = fspecial('gaussian',size(i),100);
figure, imshow(ha,[]), title('Gaussian Filter') %[] bcz range is unknown

figure, mesh(abs(ha)), title('Shape of Gaussian Filter')

%d
close all
ga = fi .* ha;
fftshow(ga), title('Filtered Fourier')
ga = ifft2(ga);
figure, imshow(ga,[]), title('Filtered Image') %blurred image (smoothing of image)

g2 = fi .* h2;
fftshow(g2), title('Filtered Fourier 2')
g2 = ifft2(g2);
figure, imshow(g2,[]), title('Filtered Image 2') %clearer than filtered image 1 bcz cut off freq >


%% Part II
clear all
close all
clc

i = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\XRay.jpg');
figure, imshow(i), title('XRay')

j = imnoise(i,'salt & pepper',0.1);
figure, imshow(j), title('Noisy Image')

%d
ha = fspecial('average',[3 3]);
ga = imfilter(j,ha);
figure, imshow(ga), title('Average Filtered Image')

%e
gm = medfilt2(j,[3 3]);
figure, imshow(gm), title('Median Filtered Image')

k1 = medfilt2(ga,[3 3]);
figure, imshow(k1), title('Median Filter on Average Filtered Image')
k2 = medfilt2(k1,[3 3]);
figure, imshow(k2), title('Second Median Filter on Average Filtered Image')