function [AlignedImage, Corners] = Align(InputImage, width, height)

[W , H , ~]=size(InputImage);
global point1
global point2
global point3
global point4
for i=1:W
    ch=0;
    for j=1:H
        if InputImage(i,j,1)<=240
            point1=[j ; i];
            ch=1;
            break
        end
    end
    if ch
        break
    end
end
for j=1:H
     ch=0;
    for i=1:W
        if InputImage(i,j,2)<=240||InputImage(i,j,1)<=240
            point2=[j ; i];
            ch=1;
            break
        end
    end
    if ch
        break
    end
end
for j=H:-1:1
    ch=0;
    for i=1:W
        if InputImage(i,j,3)<=240
            point3=[j ; i];
            ch=1;
            break
        end
    end
    if ch
        break
    end
end
for i=W:-1:1
    ch=0;
    for j=1:H
        if InputImage(i,j,2)<=250&&InputImage(i,j,3)<=50&&InputImage(i,j,1)<=50
            point4=[j ; i];
            
             ch=1;
            break
        end
    end
    if ch
        break
    end
end
p1 =[point1 point2 point3 point4];
p2=p1;

p2=[p2; 1 1 1 1];
disp(p2);
Corners=[width 1 width 1 ;1 1 height height];
Q=[width 1 width 1 ;1 1 height height ;1 1 1 1];
disp(p1);
AlignedImage=Warp(InputImage, p2,Q,[width height]);
end

