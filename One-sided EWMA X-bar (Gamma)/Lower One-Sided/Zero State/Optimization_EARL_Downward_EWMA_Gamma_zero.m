% Optimisation of EARL for Downward EWMA Xbar for Gamma %
% Zero State %
% EARL0 = 370.4 (Same as ATS0) % 

clearvars ; 
clc ; 

tic ; 

% Gamma distribution parameters
a_shape = 4 ; % shape parameters
b_scale = 1 ; % scale parameters 

n = 5 ; % sample size
deltamin = -0.75 ; % Minimum shift size
deltamax = -0.10 ; % Maximum shift size 

[lam, K, EARL, EARL0] = lamKearlewmacgammad(deltamin, deltamax, n, a_shape, b_scale) ; 

disp(['The minimum delta is:', num2str(deltamin)])
disp(['The maximum delta is:', num2str(deltamax)])
disp(['The lam is          :', num2str(lam)])
disp(['The K is            :', num2str(K)])
disp(['The EARL is         :', num2str(EARL)])
disp(['The EARL0 is        :', num2str(EARL0)])

toc ; 