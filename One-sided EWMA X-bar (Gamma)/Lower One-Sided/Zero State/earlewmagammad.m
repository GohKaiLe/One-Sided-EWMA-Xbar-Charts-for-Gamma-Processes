% Lower One-sided EWMA X-bar Chart for Gamma %
% Zero State %
% Create a fucntion to find EARL %

function [EARL] = earlewmagammad(deltamin, deltamax, n, K, lam, a_shape, b_scale)

[xi, wi] = lgwt_table(9) ; 
EARLsum = 0 ; 

for il = 1:9 
    xil = xi(il) ; 
    wil = wi(il) ; 
    d = ((deltamax - deltamin)/2)*xil+((deltamax + deltamin)/2) ;
    ARL = ARLFindLower(n, d, K, lam, a_shape, b_scale) ; 
    EARLi = (1/(deltamax - deltamin)) * ARL * wil ; 
    EARLsum = EARLsum + EARLi ; 

end

EARL = ((deltamax - deltamin)/2) * EARLsum ; 

end
