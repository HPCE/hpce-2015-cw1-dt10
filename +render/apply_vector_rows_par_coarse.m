function [out]=apply_vector_rows_par_coarse(f, border, in)
% apply_vector_rows_par_coarse Uses coarse-grain parallelism over vectors.
%
% f - A function taking a 2*border+1 x 2*border+1 matrix of pixels
% win - How much extra surrounding input is needed to produce one pixel
% in - Input image as a gray-scale double-precision matrix
%
% Given an input image of width=size(in,2) and height=size(in,1), this
% produces an image of size (height-2*border) x (width-2*border).
%
% Ensures that for all border<y<=height-border and border<x<=width-border
%  out(y-border,x-border) = f( in(y-border:y+border,x-border:x+border) )
%
% > [out]=render.apply_scalar(@(x)(1-x), 0, image); % invert an image

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2*border;
wOut=wIn-2*border;

out=zeros(hOut,wOut);

bounds=[1 floor(hOut/4) floor(hOut/2) floor(hOut*3/4) hOut+1];

out=[];
parfor id=1 : 4
    yLo=bounds(id);
    yHi=bounds(id+1)-1;
    
    inPart=in(yLo:yHi+2*border, wOut);
    resPart=zeros(yHi-yLo+1,wOut);
    
    for y=1:(yLo-yHi+1)
        nhood = inPart(y:y+2*border , : );
        resPart(y,:) = f(nhood);
    end
    
    out=[out ; resPart];
end
