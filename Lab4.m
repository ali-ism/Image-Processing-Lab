%% Part I
clear all
close all
clc
i = imread('rice.png');
i = im2double(i); % we need the picture range to be between 0 and 1
figure
subplot(1,2,1)
imshow(i), title('Original Image')
subplot(1,2,2)
imhist(i)
i1 = imadjust(i,[0.1 0.8],[0 1]);
figure
subplot(3,2,1)
imshow(i1), title('Gamma 1')
subplot(3,2,2)
imhist(i1)
i2 = imadjust(i,[0.1 0.8],[0 1],0.1);
subplot(3,2,3)
imshow(i2), title('Gamma 0.1')
subplot(3,2,4)
imhist(i2)
i3 = imadjust(i,[0.1 0.8],[0 1],5);
subplot(3,2,5)
imshow(i3), title('Gamma 5')
subplot(3,2,6)
imhist(i3)
%Interpretation: gamma 1 streches the histogram, so we have more color
%variation. gamma >1 shifts colors towards 0 and <1 towards 1.

%% Part II
clear all
close all
clc

i = imread('pout.tif');
i = im2double(i);
figure
subplot(2,2,1)
imshow(i), title('Original Image')
subplot(2,2,2)
imhist(i)
ieq = histeq(i);
subplot(2,2,3)
imshow(ieq), title('Equalized Image')
subplot(2,2,4)
imhist(ieq)

%2
prob = imhist(i) ./ numel(i);
cdf = cumsum(prob);

x = linspace(0,1,length(prob));
figure
plot(x,cdf), xlabel('Input Values'), ylabel('Output Values')
%Interpretation: colors are distributed with good color variation

%3
i1 = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\mars_moon_phobos.tif');
i1 = im2double(i1);
figure
subplot(2,2,1)
imshow(i1), title('Original Image')
subplot(2,2,2)
imhist(i1)
i1eq = histeq(i1);
subplot(2,2,3)
imshow(i1eq), title('Equalized Image')
subplot(2,2,4)
imhist(i1eq)

%2
prob1 = imhist(i1) ./ numel(i1);
cdf1 = cumsum(prob1);

x = linspace(0,1,length(prob1));
figure
plot(x,cdf1), xlabel('Input Values'), ylabel('Output Values')