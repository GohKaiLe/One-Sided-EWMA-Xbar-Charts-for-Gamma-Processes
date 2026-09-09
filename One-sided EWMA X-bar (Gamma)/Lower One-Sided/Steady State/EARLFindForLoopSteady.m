% Optimization of EARL for Downward EWMA Xbar for Gamma %
% Steady State %
% EARL0 = 370.4 % % If want to change, change the EARL0 in Kewmagammau.m %

clearvars ; 
clc ; 

tic ; 

% Gamma distribution parameters
a_shape = 1 ; % shape parameters
b_scale = 1 ; % scale parameters 

n = 5 ; % sample size
deltamin = -2.00 ; % Minimum shift size
deltamax = -0.03 ; % Maximum shift size 

[lam, K, EARL, EARL0] = lamKssearlewmacgammad(deltamin, deltamax, n, a_shape, b_scale) ; 

disp(['The minimum delta is:', num2str(deltamin)])
disp(['The maximum delta is:', num2str(deltamax)])
disp(['The lam is   :', num2str(lam)])
disp(['The K is     :', num2str(K)])
disp(['The EARL is  :', num2str(EARL)])
disp(['The EARL0 is :', num2str(EARL0)])

delta_values = -0.1:-0.1:-2.0 ; % individual shift sizes to evaluate
num_deltas = length(delta_values);

results = table(...
    'Size', [num_deltas, 3], ... % Now 3 variables
    'VariableTypes', {'double', 'double', 'double'}, ... % 3 types
    'VariableNames', {'delta', 'ARL1', 'SDRL1'});

for d = 1:num_deltas

    delta = delta_values(d);
    [ARL0, ~] = ARLFindLowerSteady(n, 0, K, lam, a_shape, b_scale) ;
    [ARL1, ~] = ARLFindLowerSteady(n, delta, K, lam, a_shape, b_scale) ; 
    [~, SDRL1]= ARLFindLowerSteady(n, delta, K, lam, a_shape, b_scale) ; 

    results.delta(d) = delta ;
    results.ARL1(d) = ARL1 ; % sama as ATS1 %
    results.SDRL1(d) = SDRL1 ; % sama as SDTS1 %
    
end

% Display final results table
disp(' ')
disp('Final Results Table:')
disp(' ')
disp(results)

toc; 
