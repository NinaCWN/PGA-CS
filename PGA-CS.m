clear;clc;close all;
%加载数据
% load('数据\simuData.mat');
% load('数据\realData.mat');
% load('数据\PointTarget_2_5.6.mat'); 
load('数据\Raw_4500_5500.mat');
load('数据\CSA_4500_5500.mat');

Rawdata=org_data;
%原始图像显示
G=abs(Rawdata);
xg=max(max(G)); ng=min(min(G)); cg=255/(xg-ng);
Ga=floor(cg*(G-ng));      
figure;
colormap(gray)
image(G);
axis('image');axis('xy')
xlabel('距离')
ylabel('方位')
title('雷达原始数据')
Hx1=ImageEntropy(Ga);                %图像熵
contrast1=Contrast(Rawdata);    %对比度

SARdata=CSA_data;
%原始图像显示
G=abs(SARdata);
xg=max(max(G)); ng=min(min(G)); cg=255/(xg-ng);
Ga=floor(cg*(G-ng));      
figure;
colormap(gray)
image(G);
axis('image');axis('xy')
xlabel('距离')
ylabel('方位')
title('CSA成像图像')
Hx2=ImageEntropy(Ga);                %图像熵
contrast2=Contrast(SARdata);    %对比度

%PGA聚焦算法
[img_corrected,Hx,contrast] = PGA(SARdata',10,0);  
%聚焦后图像显示
G=abs(img_corrected');
xg=max(max(G)); ng=min(min(G)); cg=255/(xg-ng);
Ga=floor(cg*(G-ng)); 
%lighten_img=lighten(G,Ga);       %聚焦后的图像亮度下降，提高图像亮度便于对比
figure;
colormap(gray)
image(G);
%imagesc(lighten_img);
axis('image');axis('xy')
xlabel('方位')
ylabel('距离')
title('PGA-CS聚焦图像')
Hx3=ImageEntropy(Ga);                      %图像熵
contrast3=Contrast(img_corrected);    %对比度
