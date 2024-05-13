% Function Convert Color Image To GrayScale Image Take One parameter 
function gray_img = ConvertToGraySingaleColorChannel(img)
    % Extract Red, Green, and Blue colors component to R, G,and B
    R=img(:, :, 1); %Red Color
    G=img(:, :, 2); %Green Color
    B=img(:, :, 3); %Blue Color
       
    % Getting number of Rows And Columns from Color Images 
    [M, N,~]=size(img);

    % create image 2D with the same size
    gray_img=zeros(M, N, 'uint8');

     %using this equation from slides
     %Gray = Red Or Green Or Blue;
    for i = 1:M
        for j = 1:N
            gray_img(i,j) = R(i, j);
        end
    end
gray_img = uint8(gray_img);
figure,imshow(img),title('Original Image')
figure,imshow(gray_img),title('Gray Image')
end
