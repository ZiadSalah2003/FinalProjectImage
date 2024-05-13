function out = SaltPepper(img)
out = imnoise(img,'salt & pepper',0.02);

%imwrite(out,'salt_pepper.jpg');
figure
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(out);title('Salt & Pepper Noise');

end