function out = RM0Order(in, fact_r, fact_c)
    [r, c, ch] = size(in);
    new_r = r * fact_r;
    new_c = c * fact_c;
    r_ratio = r / new_r;
    c_ratio = c / new_c;
    out = zeros(new_r, new_c, ch);
    
    for k = 1:ch
        for new_x = 1:new_r
            old_x = new_x * r_ratio;
            old_x = round(old_x);
            if (old_x == 0)
                old_x = 1;
            end
            for new_y = 1:new_c
                old_y = new_y * c_ratio;
                old_y = round(old_y);
                if (old_y == 0)
                    old_y = 1;
                end
                out(new_x, new_y, k) = in(old_x, old_y, k);
            end
        end
    end
    
    out = uint8(out);
    % Uncomment the following lines if you want to display the images
     figure, imshow(in), title('Original');
     figure, imshow(out), title('Resized Image');
end