function [image_gauss] = gaussian_filter(image)
    gaussian_kernel = fspecial('gaussian', 100, 10);
    gaussian_kernel_1d = gaussian_kernel(21, :);
    gaussian_kernel_1d = gaussian_kernel_1d / sum(gaussian_kernel_1d);

    image_gauss_horizontal = imfilter(image, gaussian_kernel_1d);
    image_gauss = imfilter(image_gauss_horizontal, gaussian_kernel_1d');
end
