function [ isTrapped ] = amITrapped( path, currenty, currentx )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if (currentx-2 > 0)
        lneighbor = path(currenty,currentx-2);
    else
        lneighbor = 1;
    end
    
    if (currenty-2 > 0)
        uneighbor = path(currenty-2,currentx);
    else
        uneighbor = 1;
    end
    
    if (currentx+2 < size(path,2))
        rneighbor = path(currenty,currentx+2);
    else
        rneighbor = 1;
    end
    
    if (currenty+2 < size(path,1))
        dneighbor = path(currenty+2,currentx);
    else
        dneighbor = 1;
    end
    
    if (lneighbor+uneighbor+rneighbor+dneighbor == 4)
        isTrapped = 1;
    else
        isTrapped = 0;
    end

end

