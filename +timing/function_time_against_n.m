function [ts,ns]=function_time_against_n(f, ns, maxTime)
% function_time_against_n Measure the execution time of a function with varying inputs
%
%  f       : A function taking a single positive integer parameter n. Execution time
%            is assumed to increase monotonically (approximately) with n.
%  ns      : A vector of monotonically increasing positive integers.
%  maxTime : Maximum amount of time the function should take (default == 3 seconds)
%  
%  This function calculates the changing execution time for a
%  function of a single parameter, as that parameter takes on
%  a vector of increasing values. The total time used to calculate
%  calculate times should be (approximately) bounded by the maxTime
%  parameter. The function should investigate as many data-points as
%  possible - if time runs out, all remaining ts values should be NaN (Not a Number).
%
%  Usage:
%
%  > f=@(n)( randn(n).^2 );
%  > timing.function_time_against_n(f, 1:20)
%
%  > [ts,ns]=timing.function_time_against_n(@(n)( randn(10)^n, 1:20) ); plot(ns,ts);
%
%  > [ts,ns]=timing.function_time_against_n(@(n)( inv(randn(n), 1:100), 10.0)  % Increase maxTime

if nargin<3
    maxTime=3;
end

ts=nan(size(ns));

start=tic();
for i=1:length(ns)
    n=ns(i);
    t=timing.function_time( @()( f(n) ) );
    ts(i)=t;
    
    if(toc(start) > maxTime)
        break;
end

end

