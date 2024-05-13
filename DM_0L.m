function New_im = DM_0L(im,fact)
[r, c, ch]=size(im);
New_r = r*fact;
New_c = c*fact;
New_im = zeros(New_r,New_c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            New_im(i*fact+1-fact:i*fact,j*fact+1-fact:j*fact,k)= im(i,j,k);
        end
    end
end
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Resized')
end