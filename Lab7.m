%% Part 1
clear all
close all
clc

im = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\aerial_view_no_turb.tif');
figure, imshow(im), title('Original Image')

se = strel('square',3);
imd = imdilate(im,se);
figure, imshow(imd), title('Dilated Image')

ime = imerode(im,se);
figure, imshow(ime), title('Eroded Image')

img = imd - ime;
figure, imshow(img), title('Morphological Gradient')

%% Part 2
clear all
close all
clc

im = imread('rice.png');
figure, imshow(im), title('Original Image')

level = graythresh(im);
imbw = im2bw(im,level);
figure, imshow(imbw), title('Thresholding') %the resulting image is noisy and some rice grains are missing

se = strel('disk',10);
imo = imopen(im,se);
figure, imshow(imo), title('Opened Image')

imnew = im - imo;
figure, imshow(imnew), title('Noise Removed From Gray Image')

level = graythresh(imnew);
imbw = im2bw(imnew,level);
figure, imshow(imbw), title('Thresholding after Noise Removal')

%% Part 3
close all
clear all
clc

im = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\text_image.tif');
figure, imshow(im), title('Original Image')
%imtool(im) %59 x 8

se = strel('rectangle',[57 6]);
imo = imopen(im,se);
figure, imshow(imo), title('Image after Opening')

%create a reference image to show extracted objects
figure, imshow(im), title('Extracted Letters')
hold on
[L,Num] = bwlabel(imo);
for i = 1:1:Num
    [r,c] = find(L == i);
    y = mean(r);
    x = mean(c);
    plot(x,y,'*r','Linewidth',4)
end

mask = im;
marker = imo;
imr = imreconstruct(marker,mask);
figure, imshow(imr), title('Reconstructed Letters')

%% Extra Application: Hole Filling
close all
clc

mask = imcomplement(im);
%create marker, 1 - im just on the borders
[r,c] = size(im);
marker = [1 - im(1,:) ; zeros(r-1,c)];
for i = 2:1:r - 1
    marker(i,:) = [(1 - im(i,1)) (zeros(1,c-2)) (1-im(i,c))];
end
marker(r,:) = 1 - im(r,:);
marker = logical(marker);

imr = imreconstruct(marker,mask);
imr = imcomplement(imr);
figure, imshow(imr), title('Hole Filling')

%% Extra Application: Border Clearing
close all
clc

mask = im;
%create marker, im just on the borders
marker = [im(1,:) ; zeros(r-1,c)];
for i = 2:1:r - 1
    marker(i,:) = [im(i,1) zeros(1,c-2) im(i,c)];
end
marker(r,:) = im(r,:);
marker = logical(marker);

imr = imreconstruct(marker,mask);
imr = im - imr;
figure, imshow(imr), title('Border Clearing')