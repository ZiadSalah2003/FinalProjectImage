function output_img = MedianFilter(im, mask_size)
    if mod(mask_size,2)==0
        mask_size=mask_size+1;
    end
im = double(im);
output_img = zeros(size(im));

boundary = floor(mask_size/2);
paddingImage = padarray(im, [boundary, boundary], 'replicate', 'both');

[row,col,ch] = size(paddingImage);
for k = 1 : ch
    for i = 1 : row - mask_size + 1
        for j = 1 : col - mask_size + 1
            temp = paddingImage(i : i+mask_size-1, j : j+mask_size-1, k);
            output_img(i,j,k) = median(temp(:));
        end
    end
end

output_img = uint8(output_img);
% im = uint8(im);
% figure,imshow(im),title('Original Image');
% figure,imshow(output_img),title('Output Image');

end