% Upper One-sided EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find ARL by searching lambda %

function [ARL] = lamewmagammau(lam, n, delta, deltaooc, a_shape, b_scale)

if (lam <= 0.05) || (lam > 1)
    ARL = 1e4 ;
else
    K = fsolve(@(K) Kewmagammau(K, lam, n, delta, a_shape, b_scale), 3, optimset('TolFun', 1e-10, 'Display', 'off')) ;
    ARL0 = ARLFindUpper(n, delta, K, lam, a_shape, b_scale) ; 
    ARL = ARLFindUpper(n, deltaooc, K, lam, a_shape, b_scale) ; 
    fprintf('lam =%6.4f  K =%6.4f  ARL =%6.2f  ARL0 =%6.2f\n', lam, K, ARL, ARL0)
end

end