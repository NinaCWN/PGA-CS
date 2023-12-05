function Hx=ImageEntropy(I)
%求一幅图像的熵值
[C,L]=size(I); %求图像的规格
Img_size=C*L; %图像像素点的总个数
G=256; %图像的灰度级
Hx=0; %图像熵
Gray=zeros(G,1);%产生一个G行1列的全零矩阵
for i=1:C
    for j=1:L
        Img_level=I(i,j)+1; %获取图像的灰度级
        Gray(Img_level)=Gray(Img_level)+1; %统计每个灰度级像素的点数
    end
end
%figure,plot(Gray,'.-'),grid on,axis tight,xlabel('灰度值'),ylabel('个数'),title('灰度直方图')
for k=1:G  %循环
    %fprintf('Gray(%d)=%d\n',k-1,Gray(k));
    Ps(k)=Gray(k)/Img_size; %计算每一个像素点的概率
    if Ps(k)~=0; %如果像素点的概率不为零
        Hx=-Ps(k)*log2(Ps(k))+Hx; %求熵值的公式
    end

% S=0;Hx=0;D=zeros(C,L);
% for i=1:C
%     for j=1:L
%         S=S+abs(I(i,j))^2; %图像总能量
%     end
% end
% for i=1:C
%     for j=1:150
%         D(i,j)=(abs(I(i,j))^2)/S;%图像的散射强度密度
%         Hx=-D(i,j)*log2(D(i,j))+Hx; %求熵值的公式
%     end
% end

end
