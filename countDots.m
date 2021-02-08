function endElement =countDots(imagePoints,s,pivot)
    newCoords = pivot+s;
    %error tolerance epsilon 
    epsilon = sqrt((s(1))^2+(s(2))^2);
    epsilon = epsilon/5;
    error = 0;
    dist = 0;
    n = 0;
    d = size(imagePoints);
    xp=0;
    yp=0;
   while(error<epsilon && n <7)
        for x = 1:d(1)
         i = imagePoints(x,1);
         j = imagePoints(x,2);
         %distance from the current point
         dist = sqrt((i-newCoords(1))^2+(j-newCoords(2))^2);
         
         if( dist < epsilon)
             xp = i;
             yp = j;
             error = dist;
         end
         end
    n = n+1;
    newCoords = [xp,yp]+s;
    
    end

endElement = [xp,yp];
if(endElement==[0,0])
    endElement = pivot;
end

end