function [CCenters,CMemberships] = MeanShift(data,bandwidth,stopThresh)

datapoints=data(:,1:(size(data,2)-1));
c=size(data,2)-1;
N=size(data,1);
weights=data(:,end);
Xmean=[];

for i=1:size(datapoints,1)
    xi=data(i,1);
    yi=data(i,2);
    wi=data(i,3);
    Xold=datapoints(i,:);
    diff=stopThresh+100;
    
    
    while (abs(diff)>stopThresh)
        
        
        
        dist=pdist2(datapoints,Xold);
   
        index=find(dist<bandwidth);
        Ind =zeros(N,c);
 

        for p=1:size(index,1)
        Ind(index(p),:)=ones(1,c);
        end
        meanX = sum(datapoints.*repmat(weights,1,size(datapoints,2)).*Ind)/(sum(weights(index)));
        Xnew= meanX;
        diff= Xold-Xnew;
        Xold=Xnew;
      
        %plot(Xnew(1),Xnew(2),'*');
    end
    Xfinal(i,:)= meanX;
end

clustercenters=1;
CMemberships= zeros(N,1);
CCenters=[];
for k=1:N
    if (CMemberships(k)~=0)
        continue;
    end
    CCenters= [CCenters ;Xfinal(k,:)];
    dist2= pdist2(Xfinal,Xfinal(k,:));
    ind= find(dist2<bandwidth);
    for p=1:size(ind)
        CMemberships(ind(p))=clustercenters;
    end
    clustercenters=clustercenters+1;
end

CCenters= CCenters(1:end,:);
end
        
        


