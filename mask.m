function [image_mask] = mask(image)
    [M, N, ~] = size(image);
    image_mask = zeros([2 * M, 2 * N]);

    for i = 1:2
        image_mask(1:2 * M, 1:N) = 1;
    end

end
