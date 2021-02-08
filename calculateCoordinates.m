function [xyz,centers] = calculateCoordinates(imagePoints,fx,fy)
    %neighboring dots reshapes the imagePoints depending on their position
    %on the image, so full chessboard should result in 8*8 matrix
    imagePoints2 = neighboringDots(imagePoints);
    d = size(imagePoints2);
    centers = zeros(2,d(1)+1,d(2)+1);
    %first we calculate inner 2D coordinates
    for i = 1:d(2)-1
        for j = 1:d(3)-1
            centers(1,i+1,j+1) = (imagePoints2(1,i,j)+imagePoints2(1,i+1,j)+imagePoints2(1,i,j+1)+imagePoints2(1,1+i,1+j))/4;
            centers(2,i+1,j+1) = (imagePoints2(2,i,j)+imagePoints2(2,i+1,j)+imagePoints2(2,i,j+1)+imagePoints2(2,1+i,1+j))/4;
           
        end
    end
    %we calculate outer 2D coordinates
    s1 = centers(:,3,4)- centers(:,3,3);
    s2 = centers(:,4,3)- centers(:,3,3)
    for i = 2:d(2)
        centers(:,i,1) = round(centers(:,i,2)-s1);
        centers(:,i,d(3)+1) = round(centers(:,i,d(3))+s1);
    end
    for i = 2:d(3)
        centers(:,1,i) = round(centers(:,2,i)-s2);
        centers(:,d(2)+1,i) = round(centers(:,d(2),i)+s2);
    end
    %now we calculate 2D coordinates of the corners
    centers(:,1,1) = round(centers(:,1,2)-s1);
    centers(:,1,d(3)+1) = round(centers(:,1,d(3))+s1);
    centers(:,d(2)+1,1) = round(centers(:,d(2),1)+s2);
    centers(:,d(2)+1,d(3)+1) = round(centers(:,d(2),d(3))+s1+s2);
   %now we can calculate 3d coordinate of 2d image points
   d = size(centers);
   xyz = zeros(3,d(2),d(3));
   for i = 1:d(2)
       for j = 1:d(3)
           %we calculate coordinates in milimeters
           xyz(3,i,j)=(40*fy)/(sqrt(s1(1)^2+s1(2)^2));
           xyz(1,i,j)=(xyz(3,i,j)*centers(1,i,j))/fx;
           xyz(2,i,j)=(xyz(3,i,j)*centers(2,i,j))/fy;
       end
   end
   
   
end

