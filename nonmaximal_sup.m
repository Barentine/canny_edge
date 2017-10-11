function [maximal_grad] = nonmaximal_sup(grad, angles)
%NONMAXIMAL_SUP Summary of this function goes here
%   angles should be from matlab's atan2, i.e. range -pi,pi

% generate coordinates
im_size = size(grad);
[cc, rr] = meshgrid(1:im_size(1), 1:im_size(2));

% calculate radius-of-one displacements parallel to gradient
r_max = rr + sin(angles);
c_max = cc + cos(angles);
% calculate gradient 1-pixel away along gradient
par_g = interp2(grad,r_max,c_max);

% calculate radius-of-one displacements ANTI-parallel to gradient
r_max = rr - sin(angles);
c_max = cc - cos(angles);
% calculate gradient 1-pixel away along gradient
anti_par_g = interp2(grad,r_max,c_max);

nms = grad >= par_g & grad >= anti_par_g;
maximal_grad = nms.*grad;

%% --- ONLY SAD MISTAKES BELOW THIS LINE
% %[cc, rr] = meshgrid(size)
% 
% 
% % pad the gradients with zeros
% interp_extent = 2;
% pad_size = interp_extent;
% g_pad = zeros(im_size + 2*pad_size);
% g_pad(1+pad_size:pad_size+im_size(1), 1+pad_size:pad_size+im_size(2)) = grad;

% loop through image, calculating at each point whether it is a local
% maximum
% [cc, rr] = meshgrid(-interp_extent:interp_extent, -interp_extent:interp_extent);
% cc = cc+3;
% rr = rr+3;
% for pr=pad_size:pad_size + im_size(1)
%     for pc=pad_size:pad_size + im_size(2)     
%         % ----- interpolate around each pixel
%         % crop to smaller size
%         crop_g = grad(1+pr-interp_extent:1+pr+interp_extent, 1+pc-interp_extent:1+pc+interp_extent);
%         
%         % interpolate and calculate magnitude
%         interp_g = interp2(rr,cc,crop_g,r_max,c_max);
%         
%         
%         
%         
%     end
% end
% 
% end

