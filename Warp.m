function R = Warp(I1, P, Q,nSize)
e=P*(P');
W=(Q*(P'))*((e)^-1);

R= GeometricLinearTransform2( I1, W,nSize);
figure,imshow(R);
end

