function [ matched_image ] = global_color_matching( image_s, image_c)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明clear  

R=image_s(:,:,1);%获取原图像R通道  
G=image_s(:,:,2);%获取原图像G通道  
B=image_s(:,:,3);%获取原图像B通道  
Rmatch=image_c(:,:,1);%获取匹配图像R通道  
Gmatch=image_c(:,:,2);%获取匹配图像G通道  
Bmatch=image_c(:,:,3);%获取匹配图像B通道  
Rmatch_hist=imhist(Rmatch);%获取匹配图像R通道直方图  
Gmatch_hist=imhist(Gmatch);%获取匹配图像G通道直方图  
Bmatch_hist=imhist(Bmatch);%获取匹配图像B通道直方图  
matched_image(:,:,1)=histeq(R,Rmatch_hist);%R通道直方图匹配  
matched_image(:,:,2)=histeq(G,Gmatch_hist);%G通道直方图匹配  
matched_image(:,:,3) =histeq(B,Bmatch_hist);%B通道直方图匹配  

end

