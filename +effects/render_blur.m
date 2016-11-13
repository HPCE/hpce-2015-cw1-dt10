function [out]=render_blur(in)
% render_blur Equivalent to render.apply_scalar(@effects.blur_scalar, 1, im)

border=1;

hIn=size(in,1);
wIn=size(in,2);

hOut=hIn-2*border;
wOut=wIn-2*border;

out=zeros(hOut,wOut);

for y=1:hOut
    for x=1:wOut
        nhood = in(y:y+2*border , x:x+2*border );
        
        pel=                  nhood(1,2)           ...
               + nhood(2,1)+4*nhood(2,2)+nhood(2,3)   ...
                            + nhood(3,2);

        pel=pel / 8; % normalise down

        out(y,x)=pel;
    end
end

end
