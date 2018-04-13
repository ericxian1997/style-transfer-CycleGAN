image_1 = imread('ˮӡ02.jpg');
image_2 = imread('ˮӡ01.jpg');
mask_image = imread('mask.jpg');
mask_image = rgb2gray(mask_image);
mask_image = uint8(imbinarize(mask_image));

new_image = image_1 .* mask_image + image_2 .* uint8(~mask_image);

imshow(new_image);