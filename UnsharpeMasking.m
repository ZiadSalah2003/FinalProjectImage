function output = UnsharpeMasking(img)
[mask, mask_size]= Guassian_function_2D(2);
padding = 6;
GuasImage=img;
outputImage=img;
Gmask=img;
image_pad = padarray(img, [padding padding], 'replicate','both');

[rows,cols,chs] = size(image_pad);

for ch=1:chs
    for r=7:rows-6
       for c=7:cols-6
            
           sum=0;
           x=1;
           for i=r-6:r+6
              y=1;
              for j=c-6:c+6
                sum=sum+(mask(x,y)*image_pad(i,j,ch));
                y = y+1;
              end
              x=x+1;
           end
           GuasImage(r-6,c-6,ch)=sum;
        
       
       end
   end
end
mask_size = mask_size-1;

for ch=1:chs
    for r=1:rows-mask_size
        for c=1:cols-mask_size
            Gmask(r,c,ch)=img(r,c,ch)-GuasImage(r,c,ch);
        end
    end
end

for ch=1:chs
    for r=1:rows-12
        for c=1:cols-12
            outputImage(r,c,ch)=img(r,c,ch)+Gmask(r,c,ch);
        end
    end
end

output = outputImage;
figure
subplot(2,2,1),imshow(img),title('orignal image');
subplot(2,2,2),imshow(GuasImage),title('Guassian image'); 
subplot(2,2,3),imshow(Gmask),title('Gmask image'); 
subplot(2,2,4),imshow(outputImage),title('Result image'); 

end