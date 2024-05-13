function new_im = MinFilter(im, mask)
    if mod(mask,2)==0
        mask=mask+1;
    end
    [r, c, ch] = size(im);
    new_im = zeros(r, c, ch, 'uint8');  % Initialize output image directly as uint8
    
    half_mask = floor(mask / 2);  % Calculate half of the mask size
    
    for k = 1:ch
        for i = 1:r
            for j = 1:c
                % Calculate window bounds
                i_start = max(1, i - half_mask);
                i_end = min(r, i + half_mask);
                j_start = max(1, j - half_mask);
                j_end = min(c, j + half_mask);

                % Extract window and find minimum
                window = im(i_start:i_end, j_start:j_end, k);
                new_im(i, j, k) = min(window(:));
            end
        end
    end
    new_im = uint8(new_im);
% figure, imshow(im), title('Original')
 %figure, imshow(new_im), title('Min Filter RGB')
end