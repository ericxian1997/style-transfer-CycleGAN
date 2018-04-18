function [ matched_image ] = linear_color_matching( image_s, image_c )
% 线性变换颜色直方图匹配
%   根据目标图像的颜色分布的均值和方差，学习出一个对源图像像素进行
%   线性变换的矩阵，从而实现直方图匹配

[height_1,width_1, ~] = size(image_s);
m = height_1;
n = width_1;

mean_s = reshape((mean(mean(image_s,2), 1)), [3,1]);
covM_s = covariance_matrix(image_s, mean_s);
mean_c = reshape((mean(mean(image_c,2), 1)), [3,1]);
covM_c = covariance_matrix(image_c, mean_c);

A = sqrtm(covM_c)*sqrtm(covM_s)^(-1);
b = mean_c - A * mean_s;

matched_image = image_s;

for i = 1:height_1
    for j = 1:width_1
        matched_image(i, j, :) = floor(A * double(reshape(image_s(i, j, :), [3,1])) + b);
    end
end

end

