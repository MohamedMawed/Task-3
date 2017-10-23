function R = Warp(I1, P, Q,nSize)

e=P*(P');

W=(Q*(P'))*((e)^-1);
tform = maketform('projective',W');
R = imtransform(I1,tform);
figure,imshow(R);
R= GeometricLinearTransform2( I1, W,nSize);
figure,imshow(R);
end

