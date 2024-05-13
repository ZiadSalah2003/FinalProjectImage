function new_light_image = Brightness(img, offset)
    [rows, cols, chs] = size(img);   % get the size of the image
    new_light_image = img;           % declare matrix to hold the new light image  

    for ch = 1:chs  % loop through RGB channels
        for row = 1:rows   % loop through rows
            for col = 1:cols    % loop through columns 
                % Brightness Light
                % Addition between pixel and offset
                new_value_light = img(row, col, ch) + offset;

                % Check if the value after addition operation exceeds 255
                if new_value_light > 255
                    new_light_image(row, col, ch) = 255;
                else
                    new_light_image(row, col, ch) = new_value_light;
                end   
            end
        end
    end

    % Uncomment if you want to display the processed image
figure,imshow(img),title('Original Image')
figure,imshow(new_light_image),title('light Image')
    % Return the processed image
    % This line is essential to fix the "Too many output arguments" error
    % You need to specify what your function should output explicitly
end