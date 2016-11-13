function [out]=median_vector(in)
% median_vector Calculate 1xw vector of medians from k x (k + w - 1) inputs

border=(size(in,1)-1)/2;
wIn=size(in,2);
wOut=wIn-2*border;

hKern=2*border+1;
kSize=hKern^2;

kernel=repmat((1:kSize)', 1, wOut);
x=repmat(1:hKern:hKern*wOut, kSize, 1);

indices=kernel+x-1;
indices=reshape(indices, wOut * kSize, 1);

nhood=in(indices);
nhood=reshape(nhood, kSize, wOut);

out=median(nhood);

end
