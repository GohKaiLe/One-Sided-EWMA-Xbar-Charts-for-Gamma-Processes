% Lower One-sided EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find lam, K, ARL, SDRL and ARL0 %

function [lam, K, ARL, SDRL, ARL0] = lamKsewmagammad(n, delta, deltaooc, a_shape, b_scale)

K0 = 2.2 ; 
lam0 = 0.05 ; 

options = optimset('TolX', 1e-4) ; 
[lam, ~] = fminsearch(@(lam) lamsewmagammad(lam, n, delta, deltaooc, a_shape, b_scale), lam0, options) ; 
if lam >= 0.95
    lam = 0.95 ; 
end
K = fsolve(@(K) Ksewmagammad(K, lam, n, delta, a_shape, b_scale), K0, optimset('TolFun', 1e-10, 'Display', 'off')) ;
[ARL, SDRL] = ARLFindLowerSteady(n, deltaooc, K, lam, a_shape, b_scale) ; 
ARL0 = ARLFindLowerSteady(n, delta, K, lam, a_shape, b_scale) ; 
fprintf('lam=%6.4f  K=%6.4f  ARL=%6.2f SDRL=%6.2f  ARL0=%6.2f\n', lam, K, ARL, SDRL, ARL0)

end
