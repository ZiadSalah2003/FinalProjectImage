function out = GaussianNoise(img)
out = imnoise(img,'gaussian',0.02);

%imwrite(out,'gaussian.jpg');

figure
subplot(1,2,1);imshow(img);title('Original Image');
subplot(1,2,2);imshow(out);title('Gaussian Noise');

end