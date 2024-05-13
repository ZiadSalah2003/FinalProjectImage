function freqArray = DrawHistogram(im)
    % Convert image to grayscale image
    img = ConvertToGrayLuminance(im);

    % Getting number of Rows and Columns
    [x, y] = size(img);

    % Create array to store the counting with size 256
    freqArray = zeros(1, 256);
    count = 0;  % variable using to counting

    for i = 1 : 256 % this loop to frequency Array
        for j = 1 : x   % this loop to rows
            for k = 1 : y  % this loop to columns
                % if pixel equal i-1 increment count
                if img(j, k) == i-1
                    count = count + 1;
                end
            end
        end
        freqArray(i) = count; % store value of count in its position
        count = 0; % reset the value to zero
    end

    % Plotting the histogram is commented out in this function
    % You can uncomment the following lines if you want to plot the histogram
     n = 0 : 255; % create array with size 256 from 0 to 255 to display on X axis
     figure
     stem(n, freqArray); % Display Histogram using stem function
     grid on; % this line to grid the graph for rows and columns
     xlabel('Index Of Pixels'); % title of x axis
     ylabel('Number of pixels for any level'); % title of Y axis
     title('Drawing the histogram'); % this to write the name of the graph
end