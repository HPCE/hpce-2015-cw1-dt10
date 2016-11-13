function [out]=apply_scalar_par_outer(f, border, in)
% apply_scalar_par_outer Apply pixel effect using parallelism over outer loop.
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

height=size(in,1);
width=size(in,2);

wRes=width-border*2;
hRes=height-border*2;

out=zeros(hRes,wRes);

parfor y=1 : hRes
    for x=1 : wRes
        nhood = in(y:y+2*border , x:x+2*border );
        out(y,x) = f(nhood);
    end
end
