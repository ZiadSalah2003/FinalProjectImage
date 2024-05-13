function new_image=HistogramEqualization(img)
new_image=zeros(size(img));
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
histogramR=zeros(1,256);
histogramG=zeros(1,256);
histogramB=zeros(1,256);
for i=0:255
histogramR(i+1)=histc(R(:),i);
histogramG(i+1)=histc(G(:),i);
histogramB(i+1)=histc(B(:),i);
end    

sumR=zeros(1,256);
sumG=zeros(1,256);
sumB=zeros(1,256);

sumR(1)=histogramR(1);
sumG(1)=histogramG(1);
sumB(1)=histogramB(1);
for i=1:255
    sumR(i+1)=sumR(i)+histogramR(i+1);
      sumG(i+1)=sumG(i)+histogramG(i+1);
        sumB(i+1)=sumB(i)+histogramB(i+1);
end


sumR=round((sumR./max(sumR))*255);
sumG=round((sumG./max(sumG))*255);
sumB=round((sumB./max(sumB))*255);


[R,G,B]=ReplaceAll(R,G,B,sumR,sumG,sumB);

new_image(:,:,1)=R(:,:,1);
new_image(:,:,2)=G(:,:,1);
new_image(:,:,3)=B(:,:,1);

new_image=uint8(new_image);
figure;subplot(1,2,1), imshow(img),title('Original');
subplot(1,2,2), imshow(new_image),title('New Image');
end

