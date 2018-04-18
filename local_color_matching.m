function [ matched_image ] = local_color_matching( image_s, image_c, m, n )
% 局部颜色直方图匹配
%   此处显示详细说明
warning off;

[height_1,width_1, ~] = size(image_s);
[height_2,width_2, ~] = size(image_c);

sub_images{m, n} = [];
sub_images_match{m, n} = [];
out_images{m, n} = [];

for i = 1:m  
    for j = 1:n
        sub_images{i,j} = image_s(floor((i-1)*(height_1/m)+1):floor(i*(height_1/m)), floor((j-1)*(width_1/n)+1):floor(j*(width_1/n)), :);
        sub_images_match{i,j} = image_c(floor((i-1)*(height_2/m)+1):floor(i*(height_2/m)), floor((j-1)*(width_2/n)+1):floor(j*(width_2/n)), :);
    end
end

for i = 1:m
    for j = 1:n
        R=sub_images{i,j}(:,:,1);%获取原图像R通道  
        G=sub_images{i,j}(:,:,2);%获取原图像G通道  
        B=sub_images{i,j}(:,:,3);%获取原图像B通道  
        Rmatch=sub_images_match{i,j}(:,:,1);%获取匹配图像R通道  
        Gmatch=sub_images_match{i,j}(:,:,2);%获取匹配图像G通道  
        Bmatch=sub_images_match{i,j}(:,:,3);%获取匹配图像B通道  
        Rmatch_hist=imhist(Rmatch);%获取匹配图像R通道直方图  
        Gmatch_hist=imhist(Gmatch);%获取匹配图像G通道直方图  
        Bmatch_hist=imhist(Bmatch);%获取匹配图像B通道直方图  
        out_images{i,j}(:,:,1)=histeq(R,Rmatch_hist);%R通道直方图匹配  
        out_images{i,j}(:,:,2)=histeq(G,Gmatch_hist);%G通道直方图匹配  
        out_images{i,j}(:,:,3)=histeq(B,Bmatch_hist);%B通道直方图匹配  
    end
end

for i = 1:m
    for j = 1:n
        matched_image(floor((i-1)*(height_1/m)+1):floor(i*(height_1/m)), floor((j-1)*(width_1/n)+1):floor(j*(width_1/n)), :) = out_images{i,j};
    end
end

end

