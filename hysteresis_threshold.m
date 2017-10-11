function str_Image = hysteresis_threshold(in_Image)

%  1. Mean iteration
in_Image = in_Image;
e = 1;
mi = 0;
m_new = mi + e + 1;
while abs(m_new - mi) > e
    mi = m_new;
    % C0 half
    c0_mask = in_Image < mi;
    c0_img = in_Image(c0_mask);
    c0_mean = median(c0_img(:));
    % C1 half
    c1_mask = in_Image >= mi;
    c1_img = in_Image(c1_mask);
    c1_mean = median(c1_img(:));
    % Average
    m_new = (c0_mean + c1_mean)*0.5;
end
%strong edge matrix
str_Image = in_Image>m_new;
% weak edges
m_mask1 = in_Image<m_new;
weak_Image = in_Image <m_new & in_Image >0;


% loop over the stronge edge, and go to the right, then left, then go down and then go
% up
[r c] = size(in_Image);
%give input x,y
for row = 2:r-1
    for col = 2:c-1
        if str_Image(row,col)==1 % strong edge
            for u = -1:1
                for v = -1:1
                   if weak_Image(row+u,col+v)==1
                       str_Image(row+u,col+v)=1;
                   end
                end     
            end
        end
    end
end
end

