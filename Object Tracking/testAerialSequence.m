for i=1:size(frames,3)
    
    mask = SubtractDominantMotion(frames(:,:,i), frames(:,:,i+1));
    img=imfuse(frames(:,:,i+1),mask);
    imshow(img);
end

    
    