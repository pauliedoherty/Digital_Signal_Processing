%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Student:          Paul Doherty
% Student Number:   10387129   
% Course:           EEEN40130: Advanced Signal Processing
% Assignment:       Assignment 2
% Date:             30/04/14
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
tic;

%Read in original image
Image1=imread('shanghai.jpg');   %read in image to be processed
Image1=Image1(:,:,1);            %possibly delete this line
Image1_H = size(Image1, 1)       %height dimension of the unprocessed image
Image1_W = size(Image1, 2)       %width dimension of the unprocessed image

%Create figure of unprocessed image
figure(1)
imshow(Image1)
title('Unprocessed image');

%Read in prototype
Image2=imread('prototype.jpg');
Image2=Image2(:,:,1);
Image2_H = size(Image2, 1) %Height of prototype image
Image2_W = size(Image2, 2) %width of prototype image
figure(2)
imshow(Image2)

%Read in wallpaper
Image3=imread('wallpaper.jpg');
Image3_H = size(Image3, 1) %height of the Original image
Image3_W = size(Image3, 2) %width of the Original image
figure(3)
imshow(Image3)

%Perform cross-correlation to find prototype pattern on original 
%unprocessed image.

 c = normxcorr2(Image2,Image1);
 figure(4)
 surf(c)        %Plot 3D result of cross-correlation
 shading flat   %provides colour map for surf function

%Find peak in cross-correlation.
[yPeak, xPeak] = find(c==max(c(:)));

%Account for the padding that normxcorr2 adds.
yOffSet = yPeak-size(Image2,1)
xOffSet = xPeak-size(Image2,2)

%Display matched area.
figure(5);
X  = axes;
imshow(Image1,'Parent', X);
imrect(X, [xOffSet, yOffSet, size(Image2,2), size(Image2,1)]);

figure(6)
Image1((yOffSet:yOffSet+(Image2_H)),xOffSet:(xOffSet+Image2_W),1) = Image3(1:(Image2_H+1),1:(Image2_W+1),1);
%close figure 6

figure(7)
imshow(Image1)
title('After The "O" Falls Off');
toc;
