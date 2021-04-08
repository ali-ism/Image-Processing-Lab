%% Part 1
close all
clear all
clc

im = imread('peppers.png');
figure, imshow(im), title('Peppers')

Rm = im(:,:,1);
figure, imshow(Rm), colormap([(0:1/255:1)' , zeros(256,1) , zeros(256,1)]), colorbar
Gm = im;
Gm(:,:,[1 3]) = 0;
figure, imshow(Gm)
Bm = im(:,:,3);
figure, imshow(Bm), colormap([zeros(256,1) , zeros(256,1) , (0:1/255:1)'])

img = rgb2gray(im);
figure, imshow(img), title('Gray Level')

%% Part 2
close all
clear all
clc

iraw = imread('tire.tif');
figure, imshow(iraw), title('Original Image')

ibw1 = iraw;
[r,c] = size(ibw1);
for i = 1:1:r
    for j = 1:1:c
        if ibw1(i,j) > 125
            ibw1(i,j) = 1;
        else
            ibw1(i,j) = 0;
        end
    end
end
ibw1 = logical(ibw1);
figure, imshow(ibw1), title('Binary, Thresh 125')

ibw2 = im2bw(iraw,70/255);
figure, imshow(ibw2), title('Binary, Thresh 70')

ibw3 = im2bw(iraw,170/255);
figure, imshow(ibw3), title('Binary, Thresh 170')