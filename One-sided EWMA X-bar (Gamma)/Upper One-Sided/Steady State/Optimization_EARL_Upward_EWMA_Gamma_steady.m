% Optimisation of EARL for Upward EWMA X-bar Chart for Gamma %
% Steady State %
% EARL0 = 370.4 (Same as AATS0) % 

clearvars ; 
clc ; 

tic ; 

% Gamma distribution parameters
a_shape = 4 ; % shape parameter
b_scale = 1 ; % scale parameter 

n = 5 ; % sample size
deltamin = 0.10 ; % Minimum shift size
deltamax = 0.75 ; % Maximum shift size 

[lam, K, EARL, EARL0] = lamKssearlewmacgammau(deltamin, deltamax, n, a_shape, b_scale) ; 

disp(['The minimum delta is:', num2str(deltamin)])
disp(['The maximum delta is:', num2str(deltamax)])
disp(['The lam is          :', num2str(lam)])
disp(['The K is            :', num2str(K)])
disp(['The EARL is         :', num2str(EARL)])
disp(['The EARL0 is        :', num2str(EARL0)])

toc ; 