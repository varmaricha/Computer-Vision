function [ E ] = essentialMatrix( F, K1, K2 )
% essentialMatrix:
%    F - Fundamental Matrix
%    K1 - Camera Matrix 1
%    K2 - Camera Matrix 2

E= K2'*F*K1;
% [U,D,V]= svd(E);
% E=U*diag([1 1 0])*V';



end

