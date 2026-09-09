% Create a fucntion to find ARL and SDRK for Upper One-sided EWMA X-bar Chart &
% Gamma Distribution %
% Zero State %

function [ARL, SDRL] = ARLFindUpper(n, delta, K, lam, a_shape, b_scale)

mu = a_shape * b_scale ; % mean for Gamma 
sig = sqrt(a_shape * b_scale ^ 2) ; % standard deviation for Gamma

UCL = mu + K * sqrt(lam/(n * (2 - lam))) * sig ; 
CL = mu ; 

% Markov Chain %

p = 200 ; % Number of subintervals 
d = (UCL - CL) / (2 * p) ; % Width 
h = [CL, CL + d : 2 * d : UCL - d] ; 
Hj = ones(p + 1, 1) * h ; 
Hi = Hj' ; 

Q1 = (Hj + d - (1 - lam) * Hi) / lam ; 
Q2 = (Hj - d - (1 - lam) * Hi) / lam ; 

Q = gamcdf(Q1 - delta * sig, n * a_shape, b_scale/n) - gamcdf(Q2 - delta * sig, n * a_shape, b_scale/n) ; 
Q0 = (mu - (1 - lam) * h') / lam ; 
Q(:, 1) = gamcdf(Q0 - delta * sig, n * a_shape, b_scale/n) ; 

% Calculation of ARL %

q = zeros(p+1, 1) ; 
q(1) = 1 ; 
I = eye(p+1) ; 
one = ones(p + 1, 1) ; 
ARL = q' * (inv(I - Q)) * one ; 

% Calculation of SDRL %

v2 = 2 * q' * (inv(I - Q)) * (inv(I - Q)) * Q * one ; 
SDRL = sqrt(v2 - ARL^2 + ARL) ; 

end