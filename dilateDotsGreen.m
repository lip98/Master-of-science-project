function [img] = dilateDotsGreen(img2,j,i)
%this function is used only to make the red dots more visible
    if(i>4 && j>4)
     for k = -4:4
         for l = -4:4
             img2(j+k,i+l,:)=0;
             img2(j+k,i+l,2)=255;
         end
     end
    end
     img = img2;
end