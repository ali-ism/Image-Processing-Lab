clc
close all
clear all

%1
im = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\BWSquares.png');
figure, imshow(im), title('Original Image')

%2
se = strel('square',3);

%3
imer = imerode(im,se);
figure, imshow(imer), title('Eroded Image')

%4
lb = im - imer; %lower boundary, was removed from the image
figure, imshow(lb), title('Lower Boundary')

%5
idil = imdilate(im,se);
figure, imshow(idil), title('Dilated Image')

%6
eb = idil - im; %external boundary, was added to the image
figure, imshow(eb), title('External Boundary')

%7
imop = imdilate(imer,se);
figure, imshow(imop), title('Eroded then Dilated Image')

%% 8
clc
close all
%use imview(imtool) to open a viewer that allows you to measure object dimensions
%and pick an appropriate structuring element
imtool(im)
b = strel('square',15);
%im8 = imerode(im,b);
%im8 = imdilate(im8,b);
im8 = imopen(im,b); %%for closing use imclose
figure, imshow(im8), title('Only Biggest Squares Left')

%% 10
clc
close all
clear all

im = imread('text.png');
figure, imshow(im), title('Original Image')
%a
se = strel('line',3,0);
imah = imerode(im,se);
figure, imshow(imah), title('Erosion by Horizontal Line')
se = strel('line',3,90);
imav = imerode(im,se);
figure, imshow(imav), title('Erosion by Vertical Line')
%b
imbv = imdilate(im,se);
figure, imshow(imbv), title('Dilation by Vertical Line')
se = strel('line',3,0);
imbh = imerode(im,se);
figure, imshow(imbh), title('Dilation by Horizontal Line')
%c
se = strel('square',3);
imc = imopen(im,se);
figure, imshow(imc), title('Opening by 3x3 Square')
%d
imd = imclose(im,se);
figure, imshow(imah), title('Closure by 3x3 Square')

%% 11
clc
close all
clear all

im = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\greycoins.jpg');
figure, imshow(im), title('Original Image')
level = graythresh(im);
im = im2bw(im,level);
figure, imshow(im), title('Binary Image')
im = imcomplement(im);
figure, imshow(im), title('White Coins')
imtool(im)
se = strel('disk',10); %se for eroding, size is radius of smallest coin
imnew = imerode(im,se);
figure, imshow(imnew), title('Eroded Coins')
se = strel('disk',7);
imnew = imdilate(imnew,se);
figure, imshow(imnew), title('Seperated Coins')