clc
close all
clear all

%% Application 1
im = imread('text.png');
figure, imshow(im), title('Original Image')

seh = strel('line',8,0);
sev = strel('line',2,90); %to connect i with its dot

imd = imdilate(im,[seh sev]);
figure, imshow(imd), title('Phrases Connected')

[L,Num] = bwlabel(imd); %returns nb of connected objects in Num

[r,c]=find(L == 2);
select1 = bwselect(im,c,r);
figure, imshow(select1), title('Second Object')

%%
seh1 = strel('line',3,0);
imd1 = imdilate(select1,[seh1 sev]);
figure, imshow(imd1), title('Single Words Connected')
[L,Num] = bwlabel(imd1);
[r,c] = find(L == 4);
select2 = bwselect(im,c,r);
figure, imshow(select2), title('Ridge Selected')

%%
imd2 = imdilate(select2,sev);
figure, imshow(imd2), title('i in Ridge connected')
[L,Num] = bwlabel(imd2);
for i = 1:1:Num
    [r,c] = find(L == i);
    letter = bwselect(select2,c,r);
    figure, imshow(letter), title(['Letter ',num2str(i)])
end

%% Application 2
clear all
close all
clc

im = imread('C:\Users\user\Documents\MATLAB\Lab Image Processing\Images\objects.png');
figure, imshow(im), title('Original Image')
hold on

[L,Num] = bwlabel(im);
for i = 1:1:Num
    [r,c] = find(L == i);
    %select = bwselect(im,c,r);
    x = mean(c);
    y = mean(r);
    plot(x,y,'*r');
end
    