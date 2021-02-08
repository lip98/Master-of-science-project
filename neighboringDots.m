function IP = neighboringDots(imagePoints)
    d = size(imagePoints);
    pivot = [0,0];
    usedDots=zeros(d);
    %5000 is a random high valued number choosen for practical purposes
    min = 5000;
    %we have to find starting point from where we search for other nearest
    %dots
     for x = 1:d(1)
         j = imagePoints(x,2);
         i = imagePoints(x,1);
         if(i<min)
             min = i;
             pivot = [i,j];
             usedDots(1,1) = i;
             usedDots(1,2) = j;
         end
     end
    %vectors v1 and v2 are designating along which directions we will do our 
    %the neighboring dots
    v1 = [0,0];
    v2 = [0,0];
    ctr = 0;
    
    while (ctr ~= 2 )
        
    min = 5000;
    min2=100000;
     
    for x = 1:d(1)
         i = imagePoints(x,1);
         j = imagePoints(x,2);
         taken = 0 ;
         %this loop is used to check whether the point has already been
         %used
         c = size(usedDots);
         for k=1:c(1)
             if (usedDots(k,2)==j && usedDots(k,1)==i)
                 taken = 1;
             end
         end
         if (taken==0)
         %distance from the pivot point
         dist = sqrt((i-pivot(1))^2+(j-pivot(2))^2);
         
         if(ctr == 0 && min>dist)
             min = dist;
             v1 = [i,j];
             usedDots(2,1) = i;
             usedDots(2,2) = j;
         end
         %Here we have to guarantee that the vector are orthogonal in
         %relation to each othert
         dist2 = [v1(1)-pivot(1),v1(2)-pivot(2)]*transpose([i-pivot(1),j-pivot(2)]);
    
         if(ctr == 1 && min2>dist2)
             min2 = dist2;
             v2 = [i,j];
             usedDots(3,1) = i;
             usedDots(3,2) = j;
         end
    end
    end
    ctr=ctr+1;
    end
%now we can end up with the pivot on the edge of the board and not the
%corner,therefore we have to find the nearest corner which will be the (1,1)
%element of the output matrix

% we define search vectors 
s1 = [v1(1)-pivot(1),v1(2)-pivot(2)];
s2 = [v2(1)-pivot(1),v2(2)-pivot(2)];
%countDots helps us find the dimension and the corner element of the output
%matrix
RUE = countDots(imagePoints,s2,pivot);
RDE = countDots(imagePoints,-s2,pivot);
CLE = countDots(imagePoints,-s1,pivot);
CRE = countDots(imagePoints,s1,pivot);
nRows = round(sqrt((RDE(1)-RUE(1))^2+(RDE(2)-RUE(2))^2)/(sqrt((s2(1))^2+(s2(2))^2)))+1;
nColumns = round(sqrt((CRE(1)-CLE(1))^2+(CRE(2)-CLE(2))^2)/(sqrt((s1(1))^2+(s1(2))^2)))+1;
IP = zeros(2,nRows,nColumns);  
for i = 0:nRows-1
    for j = 0:nColumns-1
        new = RUE-i*s2+j*s1;
        IP(1,i+1,j+1) = new(1);
        IP(2,i+1,j+1) = new(2);
    end
end
end