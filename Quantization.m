function output = Quantization(Old_Image,k)

GrayLevel = 2^k;

Gap = 256/GrayLevel;

Colors = Gap:Gap:256;

[rows, cols,chs]=size(Old_Image);

New_Image = zeros(rows,cols,chs);

for ch=1:chs
    for row=1:rows
        for col=1:cols
             Temp=Old_Image(row, col,ch)/Gap;
        
             Index = floor (Temp);
             if Index==0
                 Index=1;
             end
             New_Image(row, col,ch) = Colors(Index);
        end

    end

end
        
      

output = uint8(New_Image);
subplot(1,2,1),imshow(Old_Image),title('orignal image');
subplot(1,2,2),imshow(output),title('Modify image');
end