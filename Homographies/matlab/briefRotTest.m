
model=imread('model_chickenbroth.jpg');
[locs1,desc1]= briefLite(model);

for a=1:36
    
    modelRot= imrotate(model,10*a);
    [locs2,desc2]= briefLite(modelRot);


[matches] = briefMatch(desc1, desc2);
matchcount(1,a)= size(matches,1);
% figure
plotMatches(model, modelRot, matches, locs1, locs2);
plotMatches(model, modelRot, matches, locs1, locs2);
end

angle=10:10:360;

bar(angle,matchcount);

