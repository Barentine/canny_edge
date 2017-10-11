
%load image
image = double(imread([pwd, '/data/xy001-1.png']));

% ignore noise with Gaussian filter
sigma = 3;
filtered = gauss_filter(image, sigma);

% find edges roughly with strobel filter
raw_edges = strobel(image);

% thin edges with nonmaximal suppresion
non_max_suppressed = nonmaximal_sup(raw_edges);

% join edges with hysteresis thresholding
edges = hystersis_threshold(non_max_suppressed);