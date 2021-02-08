function [img] = dilateDots(img2,j,i)
%this function is used only to make the red dots more visible
     for k = -4:4
         for l = -4:4
             img2(j+k,i+l,:)=0;
             img2(j+k,i+l,1)=255;
         end
     end
     img = img2;
end
