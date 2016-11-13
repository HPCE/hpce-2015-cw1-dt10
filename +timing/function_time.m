function [t]=function_time(f)
% function_time Return the execution time for a single execution of f() in seconds
% 
%  f : A function with no inputs
% 
% The timing accuracy is 10% or better. This function supports
% execution times of f from micro-seconds to minutes efficiently.
%    
% Examples:
%  
% > f=@()( sin(1) );  timing.function_time(f)
%
% > timing.function_time(@()( randn(1000)*randn(1000) ) )

if nargin<2
    minTime=0.01;
end

totalTime=0;
reps=1;
while 1
    tic;
    for i=1:reps
        f();
    end
    totalTime=toc;
    
    if  totalTime>=minTime
        break;
    else
        reps=reps*2;
    end
end

t=totalTime/reps;

end
