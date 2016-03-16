function [histInter] = distanceToSet(wordHist, histograms)


mindist = bsxfun(@min, wordHist, histograms);
%wordHist2 = repmat(wordHist,1,size(histograms,2));
%mindist = min(wordHist2,histograms);
histInter=sum(mindist);



end
