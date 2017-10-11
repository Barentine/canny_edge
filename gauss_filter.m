function [outputArg1] = gauss_filter(image,size)
%GAUSS_FILTER takes preloaded <image> input and apply gaussian filter
%ising Matlab Gauss filter fspecial and smooth function imfilter, with 
%   hsize <size> input

% gaussian filter
gauss = fspecial('gaussian',size,5);
% smoothing
outputArg1 = imfilter(image,gauss);

end
% to call
% image = double(imread('data/xy001-1.png'));
% imagesc(gauss_filter(image,10))
