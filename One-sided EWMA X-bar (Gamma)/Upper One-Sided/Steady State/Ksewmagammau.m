% Upper One-sided EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find f %

function [f] = Ksewmagammau(K, lam, n, delta, a_shape, b_scale)

if K <= 0
    f = Inf ;
else
    ARL = ARLFindUpperSteady(n, delta, K, lam, a_shape, b_scale) ; 
    f = (370.4 - ARL) / 370.4 ; 

end