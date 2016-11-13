function [out]=sobel_vector(in)
% scharr_vector Calculate 1xw scharr edge weights using 3 x (2+w) input pixels

vert=  -3*in(1,1:end-2) -10*in(1,2:end-1) -3*in(1,3:end) ...
       +3*in(3,1:end-2) +10*in(3,2:end-1) +3*in(3,3:end);    
   
horz=  - 3*in(1,1:end-2)  +  3*in(1,3:end)...
       -10*in(2,1:end-2)  + 10*in(2,3:end)...
       - 3*in(3,1:end-2)  +  3*in(3,3:end);

out=sqrt(vert.^2 + horz.^2);

% Normalise to remain within 0..1
out=min(out/8,1);

end
