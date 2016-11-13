function [out]=median_vector_fake(in)
% median_vector_fake Sequentially calculate 1xw vector of medians from k x (k + w - 1) inputs
%  While the interface is vectorised, the implementation is sequential.

border=(size(in,1)-1)/2;
wIn=size(in,2);
wOut=wIn-2*border;

for x=1:wOut
    nhood=in(1:2*border+1,x:x+2*border);
    out(x)=median(nhood(1:numel(nhood)));
end

end
