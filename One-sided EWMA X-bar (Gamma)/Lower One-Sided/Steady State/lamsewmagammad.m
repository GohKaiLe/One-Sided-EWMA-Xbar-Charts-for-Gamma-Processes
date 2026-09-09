% Lower One-sided EWMA X-bar Chart for Gamma %
% Steady State %
% Create a function to find ARL by searching lambda %

function [ARL] = lamsewmagammad(lam, n, delta, deltaooc, a_shape, b_scale)

if (lam <= 0.05) || (lam > 1)
    ARL = 1e4 ;
else
    K = fsolve(@(K) Ksewmagammad(K, lam, n, delta, a_shape, b_scale), 2.2, optimset('TolFun', 1e-10, 'Display', 'off')) ;
    ARL0 = ARLFindLowerSteady(n, delta, K, lam, a_shape, b_scale) ; 
    ARL = ARLFindLowerSteady(n, deltaooc, K, lam, a_shape, b_scale) ; 
    fprintf('lam=%6.4f  K=%6.4f  ARL=%6.2f  ARL0=%6.2f\n', lam, K, ARL, ARL0)
end

end