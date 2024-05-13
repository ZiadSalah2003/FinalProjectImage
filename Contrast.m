% Function Show Contrast for Image Take 1 parameter 
function x = Contrast(img,smin,smax)
    x=zeros(size(img));
    channels=size(img,3);
    oldmin=zeros(channels);
    oldmax=zeros(channels);
    rmax=0;
    rmin=0;
    f1=0;
    s=0;
    for k=1:channels
     oldmin(k)=min(min(img(:,:,k)));
     oldmax(k)=max(max(img(:,:,k)));
    end
    for k=1:channels
        for i=1:size(img,1)
            for j=1:size(img,2)
                r=img(i,j,k);
                rmax=oldmax(k);
                rmin=oldmin(k);
                f1=(smax-smin)/(rmax-rmin);
                s=f1*(r-rmin);
                if(s>255)
                    s=255;
                elseif(s<0)
                    s=0;
                end
                x(i,j,k)=s;
            end
        end
    end
x=uint8(x);
figure,imshow(img),title('Original Image')
figure,imshow(x),title('Output Image')
end

