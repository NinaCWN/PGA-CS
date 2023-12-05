%计算图像对比度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function contrast = Contrast(pic)
% [m,n] = size(pic);%求原始图像的行数m和列数n
% g = padarray(pic,[1 1],'symmetric','both');%对原始图像进行扩展
% [r,c] = size(g);%求扩展后图像的行数r和列数
% g = double(g); %把扩展后图像转变成双精度浮点数
% k = 0.0; %定义一数值k，初始值为0
% for i=2:r-1
%     for j=2:c-1
%         k = k+(g(i,j-1)-g(i,j))^2+(g(i-1,j)-g(i,j))^2+(g(i,j+1)-g(i,j))^2+(g(i+1,j)-g(i,j))^2+(g(i-1,j-1)-g(i,j))^2+(g(i-1,j+1)-g(i,j))^2+(g(i+1,j-1)-g(i,j))^2+(g(i+1,j+1)-g(i,j))^2;
%     end
% end%计算原始图像对比度
% contrast = k/(8*(m-2)*(n-2)+6*(2*(m-2)+2*(n-2))+4*3);
pic=abs(pic).^2;
E=mean(mean(pic),2);
contrast=sqrt(mean(mean((pic-E).^2),2))/E;
end
