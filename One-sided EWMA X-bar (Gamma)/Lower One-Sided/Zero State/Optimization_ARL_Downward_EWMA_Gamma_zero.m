% Optimisation of ARL for Downward EWMA X-bar Chart for Gamma %
% Zero State %
% ARL0 = 370.4 (Same as ATS0) % 

clearvars ; 
clc ; 

tic ; 

% Gamma distribution parameters
a_shape = 4 ; % shape parameter
b_scale = 1 ; % scale parameter 

n = 5 ; % sample size
delta = 0.00 ; % In-control shift size
deltaooc = -0.10 ; % Out-of-control shift size 

[lam, K, ARL, SDRL, ARL0] = lamKewmagammad(n, delta, deltaooc, a_shape, b_scale) ; 
disp(['The shift is:', num2str(deltaooc)])
disp(['The lam is  :', num2str(lam)])
disp(['The K is    :', num2str(K)])
disp(['The ARL is  :', num2str(ARL)])
disp(['The SDRL is :', num2str(SDRL)])
disp(['The ARL0 is :', num2str(ARL0)])

toc ; 