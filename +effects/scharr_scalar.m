function [out]=sobel_scalar(in)
% scharr_scalar Calculate edge magnitude according to scharr weights

vert=  -3*in(1,1) -10*in(1,2) -3*in(1,3) ...
       +3*in(3,1) +10*in(3,2) +3*in(3,3);    
   
horz=  - 3*in(1,1)  +  3*in(1,3)...
       -10*in(2,1)  + 10*in(2,3)...
       - 3*in(3,1)  +  3*in(3,3);

out=sqrt(vert.^2 + horz.^2);

% Normalise to remain within 0..1
out=min(out/8,1);

end
