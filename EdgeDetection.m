function [newimage]= EdgeDetection(img)
     img = ConvertToGrayLuminance(img);
     [old_rows, old_cols] = size(img);
     newimage = zeros(old_rows,old_cols);
     img =double(img);
     newimage = double(newimage);

    % Sobel Operator Mask
     MVertical= [-1 0 1; -2 0 2; -1 0 1];
     MHorizontal = [-1 -2 -1; 0 0 0; 1 2 1];
     D1 = [0 1 2; -2 0 1; -2 -1 0];
     D2 = [2 1 0; 1 0 -1; 0 -1 -2];

% Edge Detection Process.
for i = 1:old_rows - 2
	for j = 1:old_cols - 2

		% Gradient approximations
		Gx = sum(sum(MVertical.*img(i:i+2, j:j+2)));
		Gy = sum(sum(MHorizontal.*img(i:i+2, j:j+2)));
        Gd1 = sum(sum(D1.*img(i:i+2, j:j+2)));
        Gd2 = sum(sum(D2.*img(i:i+2, j:j+2)));
				
		% Calculate D of vector
		newimage(i+1, j+1) = max([Gx ,Gy,Gd1,Gd2]);
		
	end
end

% Displaying Filtered Image
newimage = uint8(newimage);
newimage=Contrast(newimage,0,255);
%figure;subplot(1,2,1), imshow(img),title('Original');
%subplot(1,2,2), imshow(new_image),title('New Image');

end