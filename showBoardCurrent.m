function boardCurrent =showBoardCurrent(positions,board)
    boardCurrent = board;
    d = size(positions);
    c = " ";
    for i = 1:d(1)
       for j = 1:d(2)
           piece = positions(i,j);
           if (piece == "WP")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\PawnW.png');
               c = "W";
           end
           if (piece == "WKi")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KingW.png');
               c = "W"; 
           end
           if (piece == "WQ")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\QueenW.png');
               c = "W";
           end
           if (piece == "WB")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\BishopW.png');
           end
           if (piece == "WR")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\RookW.png');
               c = "W";
           end
           if (piece == "WK")
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KnightB.png');
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KnightW.png');
               c = "W";
           end
           if (piece == "BP")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\PawnB.png');
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\PawnW.png');
               c = "B";
           end
           if (piece == "BKi")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KingB.png');
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\Kingw.png');
               c = "B";
           end
           if (piece == "BQ")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\QueenB.png');
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\QueenW.png');
               c = "B";
           end
           if (piece == "BB")
               c = "B";
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\BishopW.png');
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\BishopB.png');
           end
           if (piece == "BR")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\RookBl.png');
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\RookW.png');
               c = "B";
           end
           if (piece == "BK")
               imgP = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KnightB.png'); 
               c = "B";
               imgP2 = imread('C:\Users\luka\Desktop\MasterOfScienceProject\chessPieces2\KnightW.png');
           end
           if(piece ~= "-")
                imgP = imresize(imgP,[70 70]);
                imgP2 = imresize(imgP2,[70 70]);
                 imB = im2bw(imgP2);
                 se = strel('disk',2,8);
                 imgP2  = imdilate(imB,se);
                for k = 11:80
                    for l = 11:80
                        if(c == "B")
                            if (imgP2(k-10,l-10)==0)
                                boardCurrent((i-1)*90+k,(j-1)*90+l,:)=board((i-1)*90+k,(j-1)*90+l,:);
                            end
                            if (imgP2(k-10,l-10)~=0)
                                boardCurrent((i-1)*90+k,(j-1)*90+l,:)=imgP(k-10,l-10)+90;
                            end
                        end
                        
                        if(c == "W")
                            if (imgP(k-10,l-10)==0)
                                boardCurrent((i-1)*90+k,(j-1)*90+l,:)=board((i-1)*90+k,(j-1)*90+l,:);
                            end
                            if (imgP(k-10,l-10)~=0)
                                boardCurrent((i-1)*90+k,(j-1)*90+l,:)=imgP(k-10,l-10);
                            end
                        end
                        
                        
                    end
                end
                
           end
       end
    end

end