function [n,l]=zernike_index(j,k)
% Usage: [n,l]=SingleIndexToDoubleIndex(termOrder,firstTermIndex,k)
%   n: degree part of double index
%   l: frequency part of double index
%   termOrder: term order ('StandardOrder','ParityOrder','FringeOrder')
%   firstTermIndex: first term index (0,1,...)
%   k: single index
% Author: Yasushi Iwasaki (Canon Inc.)
%error(nargchk(3,3,nargin,'struct'));
%j=k-firstTermIndex;
j = j-1;
%Parity Order
n=floor((-1+sqrt(8*j+1))/2);
i=j-n*(n+1)/2+1;
m=i-mod(n+i,2);
l=(-1)^k*m;

end
