clear; clc; close all;

[left, right] = get_images();

mask = imresize(gaussian_filter(mask(left)), 0.5);
mask_lv1 = imresize(gaussian_filter(mask), 0.5);
mask_lv2 = imresize(gaussian_filter(mask_lv1), 0.5);

left_gauss_lv1 = gaussian_filter(left);
left_lv1 = imresize(left_gauss_lv1, 0.5);
left_res_lv1 = left - left_gauss_lv1;

left_gauss_lv2 = gaussian_filter(left_lv1);
left_lv2 = imresize(left_gauss_lv2, 0.5);
left_res_lv2 = left_lv1 - left_gauss_lv2;

left_gauss_lv3 = gaussian_filter(left_lv2);
left_lv3 = imresize(left_gauss_lv3, 0.5);
left_res_lv3 = left_lv2 - left_gauss_lv3;

left_lap_lv1 = left - imresize(left_lv1, 2);
left_lap_lv2 = left_lv1 - imresize(left_lv2, 2);
left_lap_lv3 = left_lv2 - imresize(left_lv3, 2);

right_gauss_lv1 = gaussian_filter(right);
right_lv1 = imresize(right_gauss_lv1, 0.5);
right_res_lv1 = right - right_gauss_lv1;

right_gauss_lv2 = gaussian_filter(right_lv1);
right_lv2 = imresize(right_gauss_lv2, 0.5);
right_res_lv2 = right_lv1 - right_gauss_lv2;

right_gauss_lv3 = gaussian_filter(right_lv2);
right_lv3 = imresize(right_gauss_lv3, 0.5);
right_res_lv3 = right_lv2 - right_gauss_lv3;

right_lap_lv1 = right - imresize(right_lv1, 2);
right_lap_lv2 = right_lv1 - imresize(right_lv2, 2);
right_lap_lv3 = right_lv2 - imresize(right_lv3, 2);

imshow([left_lap_lv1, right_lap_lv1])

lap_lv1 = mask .* left_lap_lv1 + (1 - mask) .* right_lap_lv1;
lap_lv2 = mask_lv1 .* left_lap_lv2 + (1 - mask_lv1) .* right_lap_lv2;
lap_lv3 = mask_lv2 .* left_lap_lv3 + (1 - mask_lv2) .* right_lap_lv3;

left_blend = (imresize(left_lv1, 2) + left_lap_lv1) .* mask;
right_blend = (imresize(right_lv1, 2) + right_lap_lv1) .* (1 - mask);
blend = left_blend + right_blend;

left_blend_lv1 = (imresize(left_lv2, 2) + left_lap_lv2) .* mask_lv1;
right_blend_lv1 = (imresize(right_lv2, 2) + right_lap_lv2) .* (1 - mask_lv1);
blend_lv1 = left_blend_lv1 + right_blend_lv1;

left_blend_lv2 = (imresize(left_lv3, 2) + left_lap_lv3) .* mask_lv2;
right_blend_lv2 = (imresize(right_lv3, 2) + right_lap_lv3) .* (1 - mask_lv2);
blend_lv2 = left_blend_lv2 + right_blend_lv2;

figure, imshow(blend);
figure, imshow(blend_lv1);
figure, imshow(blend_lv2);

mkdir Blended_Images
imwrite(blend, 'Blended_Images/blend.jpg');
imwrite(blend_lv1, 'Blended_Images/blend_lv1.jpg');
imwrite(blend_lv2, 'Blended_Images/blend_lv2.jpg');
