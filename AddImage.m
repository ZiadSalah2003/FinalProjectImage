% Function to add two images
function New_Image = AddImage(img1, img2)

% Get the size of the images
[rows1, cols1, chs1] = size(img1);
[rows2, cols2, chs2] = size(img2);

% Determine the common size for both images
rows = min(rows1, rows2);
cols = min(cols1, cols2);
chs = min(chs1, chs2);

% Initialize the new image matrix
New_image = zeros(rows, cols, chs);

% Add the corresponding pixels from both images
for ch = 1:chs
    for row = 1:rows
        for col = 1:cols
            Value = double(img1(row, col, ch)) + double(img2(row, col, ch));
            New_image(row, col, ch) = min(Value, 255); % Ensure values do not exceed 255
        end
    end
end

% Convert the matrix to uint8 to represent an image
New_Image = uint8(New_image);

% Display the images
subplot(1, 3, 1), imshow(img1), title('Image 1');
subplot(1, 3, 2), imshow(img2), title('Image 2');
subplot(1, 3, 3), imshow(New_Image), title('New Image');

end