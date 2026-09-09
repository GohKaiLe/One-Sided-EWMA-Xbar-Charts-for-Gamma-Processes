% Lower One-sided EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find f %

function [f] = Kewmagammad(K, lam, n, delta, a_shape, b_scale)

if K <= 0
    f = Inf ;
else
    ARL = ARLFindLower(n, delta, K, lam, a_shape, b_scale) ; 
    f = (370.4 - ARL) / 370.4 ; 

end