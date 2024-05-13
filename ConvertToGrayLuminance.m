% Function Convert Color Image To GrayScale Image Take One parameter 
function gray_img = ConvertToGrayLuminance(img)
    % Extract Red, Green, and Blue colors component to R, G,and B
    R=img(:, :, 1); %Red Color
    G=img(:, :, 2); %Green Color
    B=img(:, :, 3); %Blue Color
       
    % Getting number of Rows And Columns from Color Images 
    [M, N,~]=size(img);

    % create image 2D with the same size
    gray_img=zeros(M, N, 'uint8');

     %using this equation from slides
     %Gray = 0.3*Red + 0.59*Green + 0.11*Blue
     for i=1:M
         for j=1:N
               gray_img(i, j)=(R(i, j)*0.3)+(G(i, j)*0.59)+(B(i, j)*0.11);
         end
     end
gray_img = uint8(gray_img);
figure,imshow(img),title('Original Image')
figure,imshow(gray_img),title('Gray Image')
end
