function resized_image = RM1Order(im, fact_r, fact_c)
    % Get the dimensions of the input image
    [r, c, ch] = size(im);
    
    % Calculate the new dimensions based on the scaling factors
    new_r = r * fact_r;
    new_c = c * fact_c;
    
    % Calculate the ratios for resizing
    r_ratio = r / new_r;
    c_ratio = c / new_c;
    
    % Initialize the output image
    out = zeros(new_r, new_c, ch);
    
    % Loop through each channel of the image
    for k = 1:ch
        % Resize along the rows
        for new_x = 1:new_r
            old_x = new_x * r_ratio;
            x1 = floor(old_x);
            if (x1 == 0)
                x1 = 1;
            end
            x2 = x1 + 1;
            if (x2 > r)
                x2 = r;
            end
            x_fraction = abs(old_x - x1);
            
            % Resize along the columns
            for new_y = 1:new_c
                old_y = new_y * c_ratio;
                y1 = floor(old_y);
                if (y1 == 0)
                    y1 = 1;
                end
                y2 = y1 + 1;
                if (y2 > c)
                    y2 = c;
                end
                p1 = im(x1, y1, k);
                p2 = im(x2, y1, k);
                p3 = im(x1, y2, k);
                p4 = im(x2, y2, k);
                y_fraction = abs(old_y - y1);
                
                % Perform bilinear interpolation
                z1 = p1 * (1 - x_fraction) + p2 * x_fraction;
                z2 = p3 * (1 - x_fraction) + p4 * x_fraction;
                new_pixel = z1 * (1 - y_fraction) + z2 * y_fraction;
                out(new_x, new_y, k) = floor(new_pixel);
            end
        end
    end
    
    % Convert the output image to uint8 format
    out = uint8(out);
    
    % Assign the output image to the resized_image variable
    resized_image = out;
end