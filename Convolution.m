function filteredImage =  Convolution(originalImage , mask)

     [imageRows, imageCols] = size(originalImage,1,2);
     [maskRows, maskCols] = size(mask);
        
    % Compute the half size of the mask
    halfMaskRows = floor(maskRows / 2);
    halfMaskCols = floor(maskCols / 2);
    
    % Initialize filtered image
    filteredImage = zeros(imageRows, imageCols);
        
    % Perform convolution
    for i = halfMaskRows + 1 : imageRows - halfMaskRows
        for j = halfMaskCols + 1 : imageCols - halfMaskCols
            % Extract the region of interest
            region = originalImage(i - halfMaskRows : i + halfMaskRows, j - halfMaskCols : j + halfMaskCols);
            
            % Perform element-wise multiplication and sum
            filteredImage(i, j) = sum(sum(double(region) .* mask));
        end
    end
end