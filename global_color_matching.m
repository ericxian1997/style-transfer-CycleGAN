function [ matched_image ] = global_color_matching( image_s, image_c)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��clear  

R=image_s(:,:,1);%��ȡԭͼ��Rͨ��  
G=image_s(:,:,2);%��ȡԭͼ��Gͨ��  
B=image_s(:,:,3);%��ȡԭͼ��Bͨ��  
Rmatch=image_c(:,:,1);%��ȡƥ��ͼ��Rͨ��  
Gmatch=image_c(:,:,2);%��ȡƥ��ͼ��Gͨ��  
Bmatch=image_c(:,:,3);%��ȡƥ��ͼ��Bͨ��  
Rmatch_hist=imhist(Rmatch);%��ȡƥ��ͼ��Rͨ��ֱ��ͼ  
Gmatch_hist=imhist(Gmatch);%��ȡƥ��ͼ��Gͨ��ֱ��ͼ  
Bmatch_hist=imhist(Bmatch);%��ȡƥ��ͼ��Bͨ��ֱ��ͼ  
matched_image(:,:,1)=histeq(R,Rmatch_hist);%Rͨ��ֱ��ͼƥ��  
matched_image(:,:,2)=histeq(G,Gmatch_hist);%Gͨ��ֱ��ͼƥ��  
matched_image(:,:,3) =histeq(B,Bmatch_hist);%Bͨ��ֱ��ͼƥ��  

end

