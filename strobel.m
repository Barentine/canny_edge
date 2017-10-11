function out_Image = strobel(in_Image)
% Function for Sober filtering
out_Image = edge(in_Image,'Sobel');
end

