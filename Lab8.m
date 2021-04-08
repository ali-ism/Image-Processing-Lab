%% Part 1
clear all
close all
clc

im = imread('moon.tif');
im = im2double(im);
figure, imshow(im), title('Original Image')

h = fspecial('laplacian',0); %0 to specify first degree filter
imf = imfilter(im,h,'replicate');
figure, imshow(imf), title('Laplacian Filtered Image')

ime = im - imf; %substraction, bcz the origin of the filter is negative
figure, imshow(ime), title('Sharpened Image')

lap2 = [1 1 1;1 -8 1;1 1 1];
imf = imfilter(im,lap2,'replicate');
figure, imshow(imf), title('Second Derivative Laplacian Filtered Image')

ime = im - imf;
figure, imshow(ime), title('Second Sharpened Image')

%% Part 2
close all
clear all
clc

im = imread('circuit.tif');
im = im2double(im);
figure, imshow(im), title('Original Image')

h = fspecial('sobel');

imf1 = imfilter(im,h,'replicate');
figure, imshow(imf1), title('Horizontal Edges')
imf2 = imfilter(im,h','replicate');
figure, imshow(imf2), title('Vertical Edges')

% imf = imfilter(imf,h1,'replicate');
% figure, imshow(imf), title('Vertical and Horizontal Edges')

imf = sqrt(imf1.^2 + imf2.^2); %to combine both images
figure, imshow(imf), title('Vertical and Horizontal Edges')

level = graythresh(imf);
imf = im2bw(imf,level);
figure, imshow(imf), title('Binary Vertical and Horizontal Edges')

ime = edge(im,'sobel');
figure, imshow(ime), title('Sobel Edge')

%% Part 3
close all
clear all
clc

im = imread('coins.png');
im = im2double(im);
figure, imshow(im), title('Original Image')

ime = edge(im,'sobel'); %no need to convert to binary bcz edge outputs binary result
figure, imshow(ime), title('Sobel Edge')
%imtool(ime)

se = strel('disk',1);
imd = imdilate(ime,se); %to fill breaks in circles
figure, imshow(imd), title('Dilated Edge Image')

imfilled = imfill(imd,'holes');
%figure, imshow(imfilled), title('Filled Edge Image')

imfilled = imerode(imfilled,se); %return to original size
figure, imshow(imfilled), title('Filled Edge Image Original Size')

[L,num] = bwlabel(imfilled);
A = zeros(1,num);
for i=1:1:num
    [r,c] = find(L == i);
    select = bwselect(imfilled,c,r);
    A(i) = bwarea(select);
end
imnew = zeros(size(im));
for i=1:1:num
    [r,c] = find(L == i);
    select = bwselect(imfilled,c,r);
    if bwarea(select) > mean(A)
        imnew = imnew + select;
    end
end
figure, imshow(imnew), title('Segmentation of Big Coins')
figure, imshow(bwperim(imnew)), title('Perimeter')

imnew = im + bwperim(imnew);
figure, imshow(imnew), title('Final Result')