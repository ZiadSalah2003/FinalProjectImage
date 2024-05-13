function img_sharp=Sharpening(img)

% Convert the image to double format
img = double(img);
[row,col,ch] = size(img);

% Define the sharpening filter mask
sharp_mask = [0 -1 0; -1 5 -1; 0 -1 0];
mask_size = size(sharp_mask, 1);
pad_size = floor(mask_size / 2);

% Pad the image with replicated pixels on all sides
img_padded = padarray(img, [pad_size pad_size], 'replicate', 'both');

% Apply the sharpening filter to the padded image
img_sharp = zeros(size(img));
for k = 1:ch
    for i = 1:row
        for j = 1:col
            temp = sum(sum(img_padded(i:i+mask_size-1, j:j+mask_size-1,k) .* sharp_mask));
            if temp > 255
                temp = 255;
            end
            if temp <= 0
                temp = 0;
            end
            img_sharp(i,j,k) = temp;
        end
    end
end

% Display the original and sharpened images side by side
img=uint8(img);
img_sharp=uint8(img_sharp);
subplot(1,2,1),imshow(img),title('orignal image');
subplot(1,2,2),imshow(img_sharp),title('Modify image'); 
end