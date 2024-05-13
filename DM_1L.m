function New_image = DM_1L(input_image, fact)

%get the data from image
[row,col,chs] = size(input_image);
new_row = row*fact;
new_col = col*fact;
output_image = zeros(new_row,new_col,chs);


%this block to fill the basic cells
for ch=1:chs
    for i_row=1:row
        for j_col=1:col
            output_image(i_row*fact+1-fact,j_col*fact+1-fact,ch)=input_image(i_row,j_col,ch);
        end
    end
end

%this block for fill the rows
%loop to move on channel
for ch=1:chs
    row_count=1;
    %loop to move on rows
    for i_row=1:fact:new_row
        col_count=1;
        %loop to move on columns
        for j_col=1:fact:new_col
            %first value 
            first = input_image(row_count,col_count,ch);
        
            %if last column then not found the second column assignment
            %with 0
            if j_col == ((col*fact) - (fact-1))
                second =0;
            else
                second = input_image(row_count,col_count+1,ch);
            end
            
            %if first more than second 
            column = j_col+1;
            if first>second
                max = first;
                min = second;
                for fact_temp=(fact-1):-1:1
                    output_image(i_row,column,ch)= round(((max-min)/fact)*fact_temp + min);
                    column = column+1;
                end
             %if second more than first   
            else
                min = first;
                max = second;
                for fact_temp=1:(fact-1)
                    output_image(i_row,column,ch) =round(((max - min)/fact)*fact_temp +min);
                    column = column+1;
                end
            end
            col_count = col_count+1;   
        end
        row_count = row_count+1;
    end
end




%this block for fill the columns
%loop to move on channel
for ch=1:chs
    %loop to move on columns
    for i_row=1:new_col
        %loop to move on columns
        for j_col=1:fact:new_row
            %first value 
            first = output_image(j_col,i_row,ch);
            
            %if last column then not found the second column assignment
            %with 0
            if j_col ==((row*fact)-(fact-1))
                second =0;
            else
                second = output_image(j_col+fact,i_row,ch);
            end
            
            %if first more than second
            rowww = j_col+1;
            if first>second
                max =first;
                min =second;
                for fact_temp=(fact-1):-1:1
                    output_image(rowww,i_row,ch)=round(((max - min)/fact)*fact_temp + min);
                    rowww = rowww+1;
                end
                
            %if second more than first
            else
                max = second;
                min = first;

                for fact_temp=1:(fact-1)
                    output_image(rowww,i_row,ch)=round(((max - min)/fact)*fact_temp + min);
                    rowww = rowww +1;
                end
            end
        end
    end
end

%display the images
New_image = uint8(output_image);
figure,imshow(input_image),title('Original')
figure,imshow(New_image),title('Resized')
end