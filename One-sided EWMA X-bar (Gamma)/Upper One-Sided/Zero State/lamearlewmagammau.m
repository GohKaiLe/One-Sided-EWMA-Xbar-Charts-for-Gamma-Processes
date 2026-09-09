% Upper One-sided EWMA X-bar Chart for Gamma %
% Zero State %
% Create a function to find EARL by seraching lambda %

function [EARL] = lamearlewmagammau(lam, n, deltamin, deltamax, a_shape, b_scale)

if (lam <= 0.05) || (lam > 1)
    EARL = 1e4 ;
else
    K = fsolve(@(K) Kewmagammau(K, lam, n, 0, a_shape, b_scale), 3, optimset('TolFun', 1e-10, 'Display', 'off')) ;
    EARL0 = ARLFindUpper(n, 0, K, lam, a_shape, b_scale) ; 
    EARL = earlewmagammau(deltamin, deltamax, n, K, lam, a_shape, b_scale) ; 
    fprintf('lam=%6.4f  K=%6.4f  EARL=%6.2f  EARL0=%6.2f\n', lam, K, EARL, EARL0)
end

end