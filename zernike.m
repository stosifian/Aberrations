function Z = zernike(i, r, theta)
% function Z = zernike(i, r, theta)
% Creates the Zernike polynomial with mode index i,
% where i = 1 corresponds to piston 
%load('zernike_index'); % load the mapping of (n,m) to i 
%n = zernike_index(i,1);
%m = zernike_index(i,2);
[n,m] = zernike_index(i,i+1);

%[theta, r] = meshgrid(theta,r);

if m==0
    Z = sqrt(n+1)*zrf(n,0,r);
else
    if mod(i,2) == 0 % i is even
        Z = sqrt(2*(n+1))*zrf(n,m,r) .* cos(m*theta);
    else % i is odd
        Z = sqrt(2*(n+1))*zrf(n,m,r) .* sin(m*theta);
    end
end
return

% Zernike radial function
function R = zrf(n, m, r)
R=0;
for s = 0 : ((n-m)/2)
    num = (-1)^s * gamma(n-s+1);
    denom = gamma(s+1) * gamma((n+m)/2-s+1) ...
        * gamma((n-m)/2-s+1);
    R = R + num / denom * r.^(n-2*s);
end




