function [ matched_image ] = local_color_matching( image_s, image_c, m, n )
% �ֲ���ɫֱ��ͼƥ��
%   �˴���ʾ��ϸ˵��
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
        R=sub_images{i,j}(:,:,1);%��ȡԭͼ��Rͨ��  
        G=sub_images{i,j}(:,:,2);%��ȡԭͼ��Gͨ��  
        B=sub_images{i,j}(:,:,3);%��ȡԭͼ��Bͨ��  
        Rmatch=sub_images_match{i,j}(:,:,1);%��ȡƥ��ͼ��Rͨ��  
        Gmatch=sub_images_match{i,j}(:,:,2);%��ȡƥ��ͼ��Gͨ��  
        Bmatch=sub_images_match{i,j}(:,:,3);%��ȡƥ��ͼ��Bͨ��  
        Rmatch_hist=imhist(Rmatch);%��ȡƥ��ͼ��Rͨ��ֱ��ͼ  
        Gmatch_hist=imhist(Gmatch);%��ȡƥ��ͼ��Gͨ��ֱ��ͼ  
        Bmatch_hist=imhist(Bmatch);%��ȡƥ��ͼ��Bͨ��ֱ��ͼ  
        out_images{i,j}(:,:,1)=histeq(R,Rmatch_hist);%Rͨ��ֱ��ͼƥ��  
        out_images{i,j}(:,:,2)=histeq(G,Gmatch_hist);%Gͨ��ֱ��ͼƥ��  
        out_images{i,j}(:,:,3)=histeq(B,Bmatch_hist);%Bͨ��ֱ��ͼƥ��  
    end
end

for i = 1:m
    for j = 1:n
        matched_image(floor((i-1)*(height_1/m)+1):floor(i*(height_1/m)), floor((j-1)*(width_1/n)+1):floor(j*(width_1/n)), :) = out_images{i,j};
    end
end

end

