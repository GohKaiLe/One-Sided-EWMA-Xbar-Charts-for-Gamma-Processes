% Lower One-sided EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find f %

function [f] = Ksewmagammad(K, lam, n, delta, a_shape, b_scale)

if K <= 0
    f = Inf ;
else
    ARL = ARLFindLowerSteady(n, delta, K, lam, a_shape, b_scale) ; 
    f = (370.4 - ARL) / 370.4 ; 

end