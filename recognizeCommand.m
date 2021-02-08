function [XY1,XY2] =recognizeCommand(keywords)
    startingCoord =keywords(1,1);
    endingCoord = keywords(2,1);
    XY1 = [0,0];
    XY2 = [0,0];
    startingCoord =char(startingCoord)
    endingCoord =char(endingCoord)
    letter1 = startingCoord(1);
    XY1(1,1)=9-mod(double(letter1),64); 
    number1 = startingCoord(2);
    XY1(1,2) = str2num( number1);
    
    letter2 = endingCoord(1);
    XY2(1,1)=9-mod(double(letter2),64)
    number2 = endingCoord(2);
    XY2(1,2) = str2num(number2);
    
end