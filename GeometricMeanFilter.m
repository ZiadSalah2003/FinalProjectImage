function x= GeometricMeanFilter(img,mask_size)
    if mod(mask_size,2)==0
        mask_size=mask_size+1;
    end
x=zeros(size(img));
temp=padarray(img,[floor(mask_size/2) floor(mask_size/2)],'replicate','both');
mask=repmat(1/(mask_size^2),mask_size,mask_size);
for k=1:size(img,3)
    for i =1:size(img,1)
        for j=1:size(img,2)
           tmask= mask.*double(temp(i:i+mask_size-1,j:j+mask_size-1,k));
           newvalue=sum(sum(tmask));
           x(i,j,k)=newvalue;
        end
    end
end

x=uint8(x);

%subplot(1,2,2);imshow(x),title('New Image');
end