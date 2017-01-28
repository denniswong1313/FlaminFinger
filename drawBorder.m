function [ border ] = drawBorder( path )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
spaces = find(path==1);
border = zeros(size(path,1),size(path,2));
for i = 1:size(spaces)
    checkx = floor(spaces(i)/size(path,2)) + 1;
    checky = mod(spaces(i),size(path,1)) + 1;
    for j = 1:4
        for k = 1:4
            if ((checky-(j-2) > 0 && checkx + (k-2) > 0) && (checky-(j-2) < size(path,1) && checkx+(k-2) < size(path,2)))
                if (path(checky-(j-2),checkx+(k-2)) == 0) 
                    border(checky-(j-2),checkx+(k-2)) = 1;
                end
            end
        end
    end   
end

for i = 1:size(path,1)
    if (path(i,1) == 0)
        border(i,1) = 1;
    end
    
    if (path(i,size(path,2)) == 0)
        border(i,size(path,2)) = 1;
    end
end

for i = 1:size(path,2)
    if (path(1,i) == 0)
        border(1,i) = 1;
    end
    
    if (path(size(path,1),i) == 0)
        border(size(path,1),i) = 1;
    end
end

end

