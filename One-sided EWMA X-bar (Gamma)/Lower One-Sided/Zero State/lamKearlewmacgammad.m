% Lower One-sided EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find lam, K, EARL and ARL0 %

function [lam, K, EARL, EARL0] = lamKearlewmacgammad(deltamin, deltamax, n, a_shape, b_scale)

K0 = 2.2 ; 
lam0 = 0.05 ; 

options = optimset('TolX', 1e-4) ; 
[lam, ~] = fminsearch(@(lam) lamearlewmagammad(lam, n, deltamin, deltamax, a_shape, b_scale), lam0, options) ; 
if lam >=0.99
    lam = 0.95 ;
end
K = fsolve(@(K) Kewmagammad(K, lam, n, 0, a_shape, b_scale), K0, optimset('TolFun', 1e-10, 'Display', 'off')) ;
EARL = earlewmagammad(deltamin, deltamax, n, K, lam, a_shape, b_scale) ; 
EARL0 = ARLFindLower(n, 0, K, lam, a_shape, b_scale) ; 
fprintf('lam=%6.4f  K=%6.4f  EARL=%6.2f  EARL0=%6.2f\n', lam, K, EARL, EARL0)

end