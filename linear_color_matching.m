function [ matched_image ] = linear_color_matching( image_s, image_c )
% ���Ա任��ɫֱ��ͼƥ��
%   ����Ŀ��ͼ�����ɫ�ֲ��ľ�ֵ�ͷ��ѧϰ��һ����Դͼ�����ؽ���
%   ���Ա任�ľ��󣬴Ӷ�ʵ��ֱ��ͼƥ��

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

