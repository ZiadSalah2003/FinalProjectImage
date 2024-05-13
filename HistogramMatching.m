function img2 = HistogramMatching(img1,img2)
new_image=zeros(size(img1));
r=img1(:,:,1);
g=img1(:,:,2);
b=img1(:,:,3);
img1=HistogramEqualization(img1);
img2=HistogramEqualization(img2);
histogramR1=zeros(1,256);
histogramG1=zeros(1,256);
histogramB1=zeros(1,256);
histogramR2=zeros(1,256);
histogramG2=zeros(1,256);
histogramB2=zeros(1,256);
R1=img1(:,:,1);
G1=img1(:,:,2);
B1=img1(:,:,3);
R2=img2(:,:,1);
G2=img2(:,:,2);
B2=img2(:,:,3);
matchingR=zeros(1,256);
matchingG=zeros(1,256);
matchingB=zeros(1,256);
for i=0:255
histogramR1(i+1)=histc(R1(:),i);
histogramG1(i+1)=histc(G1(:),i);
histogramB1(i+1)=histc(B1(:),i);
end    

for i=0:255
histogramR2(i+1)=histc(R1(:),i);
histogramG2(i+1)=histc(G1(:),i);
histogramB2(i+1)=histc(B1(:),i);
end
subtR=zeros(1,256);
subtG=zeros(1,256);
subtB=zeros(1,256);
for i=1:256
    for j=1:256
       subtR(j)=abs(histogramR1(i)-histogramR2(j));
       subtG(j)=abs(histogramG1(i)-histogramG2(j));
       subtB(j)=abs(histogramB1(i)-histogramB2(j));
    end
    miR=min(subtR);
    firstR=find(subtR==miR);
    firstR=firstR(1);
    firstR=firstR+1;
    matchingR(i)=firstR;
    
    
    miG=min(subtG);
    firstG=find(subtG==miG);
    firstG=firstG(1);
    firstG=firstG+1;
    matchingG(i)=firstG;
    
      miB=min(subtB);
    firstB=find(subtB==miB);
    firstB=firstB(1);
    firstB=firstB+1;
    matchingB(i)=firstB;
    
    
end


[r,g,b]=ReplaceAll(R1,G1,B1,matchingR,matchingG,matchingB);

new_image(:,:,1)=r(:,:,1);
new_image(:,:,2)=g(:,:,1);
new_image(:,:,3)=b(:,:,1);
 
new_image=uint8(new_image);
figure;subplot(2,2,1), imshow(img1),title('img1');
subplot(2,2,2), imshow(img2),title('img2');
subplot(2,1,2), imshow(new_image),title('new');
end