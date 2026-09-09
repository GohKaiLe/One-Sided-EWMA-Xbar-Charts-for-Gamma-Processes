% Optimisation of EARL for Upward EWMA X-bar for Gamma %
% Zero State %
% EARL0 = 370.4 (Same as ATS0) % 

clearvars ; 
clc ; 

tic ; 

% Gamma distribution parameters
a_shape = 1.418 ; % shape parameters
b_scale = 36.4364 ; % scale parameters 

n = 5 ; % sample size
deltamin = 0.03 ; % Minimum shift size
deltamax = 2.00 ; % Maximum shift size 

[lam, K, EARL, EARL0] = lamKearlewmacgammau(deltamin, deltamax, n, a_shape, b_scale) ; 

disp(['The minimum delta is:', num2str(deltamin)])
disp(['The maximum delta is:', num2str(deltamax)])
disp(['The lam is          :', num2str(lam)])
disp(['The K is            :', num2str(K)])
disp(['The EARL is         :', num2str(EARL)])
disp(['The EARL0 is        :', num2str(EARL0)])

toc ; 