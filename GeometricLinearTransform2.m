function ImgAfter  = GeometricLinearTransform2(I,W,newsize)
[oldH oldW ~]=size(I);
[m ~]=size(W);
if m==2
des=W*[1 oldW 1 oldW;1 1 oldH oldH];
else if m==3
 des=W*[1 oldW 1 oldW;1 1 oldH oldH;1 1 1 1];       
end

Maxdes=max((des.'));
Mindes=min((des.'));

newW = newsize(1);%round(Maxdes(1)-Mindes(1));%maxX-minX
newH = newsize(2);%round(Maxdes(2)-Mindes(2));%maxY-minY
if m==2
W = [W ; [ 0  0 ]];
W = [W [0 ; 0 ; 1]];

W(1,3) = -Mindes(1);%min X
W(2,3) = -Mindes(2);%min Y
end
W =(W^-1);
ImgAfter  = uint8(zeros(newH, newW, 3));


for i = 1 : newH
    for j = 1 : newW
       source  =  W * [ j ; i ; 1];
       x =round(source );
       if ( x (1)>= 1 && x (1)<= oldW && x (2) >= 1 && x (2) <= oldH )
           ImgAfter (i ,j ,:) = I(x (2),x (1),:);
       end
    end
end

end
