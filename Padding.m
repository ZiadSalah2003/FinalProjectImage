function imageBorder = Padding( oldImage,sizeMask)
[row,col,ch]=size(oldImage);
paddingImage=zeros(row,col,ch);
boundary=floor(sizeMask/2);
imageBorder=padarray(oldImage,[boundary,boundary],'replicate','both');
[newRow,newCol,n]=size(imageBorder);

end