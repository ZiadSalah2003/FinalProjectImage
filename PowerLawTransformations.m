% Function Show powerLaw for Image Take two parameters image and gamma 
function Newimage=PowerLawTransformations(img,gamma)

img=im2double(img);
[row, col, ch]=size(img);
Newimage=zeros(row,col,ch);
for k=1:ch
    for i=1:row
      for j=1:col
          Newimage(i,j,k)=power((img(i,j,k)),gamma);
      end
    end
end
Newimage=Contrast(Newimage,0,255);

figure;subplot(1,2,1), imshow(img),title('old');
subplot(1,2,2), imshow(Newimage),title('new');

figure,imshow(img),title('Original Image')
figure,imshow(New_image),title('Gray Image')

end