function [compareX, compareY] = makeTestPattern(patchWidth, nbits)

compareX=randsample((patchWidth*patchWidth),nbits,1);
compareY=randsample((patchWidth*patchWidth),nbits,1);

save ('testpattern.mat','compareX', 'compareY','patchWidth','nbits')

end

