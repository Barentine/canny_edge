function [grad, angles] = gradient(image)
%GRADIENT calculates the gradient using forward derivatives - beware edge
% effects
im_size = size(image);

% first take column-wise derivative
right_shifted = zeros(im_size);
right_shifted(:, 2:end) = image(:, 1:end - 1);
c_der = -(right_shifted - image);  % negate because I wanted forward deriv.

% now take the row-wise derivative
down_shifted = zeros(im_size);  % note that for speed, we could reuse right_shifted if we wanted to
down_shifted(2:end, :) = image(1:end-1, :);
r_der = -(down_shifted - image);

% determine the overall gradient
grad = sqrt(r_der.^2 + c_der.^2);
angles = atan2(r_der, c_der);
end

