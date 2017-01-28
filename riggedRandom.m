function [ next_dir, nextx, nexty, card_dir, block_space ] = riggedRandom( block_space, isTrapped, currentx, currenty )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (isTrapped == 0)
    next_dir = randi(3,1);
    nextx = currentx;
    nexty = currenty;

    switch block_space
        case 1 
            switch next_dir
                case 1
                    nextx = currentx - 2;
                    block_space = 4;
                    card_dir = 'l';
                case 2
                    nexty = currenty - 2;
                    block_space = 1;
                    card_dir = 'u';
                case 3
                    nextx = currentx + 2;
                    block_space = 2;
                    card_dir = 'r';
            end
        case 2 
            switch next_dir
                case 1
                    nexty = currenty + 2;
                    block_space = 3;
                    card_dir = 'd';
                case 2
                    nextx = currentx + 2;
                    block_space = 2;
                    card_dir = 'r';
                case 3
                    nexty = currenty - 2;
                    block_space = 1;
                    card_dir = 'u';
            end
        case 3 
            switch next_dir
                case 1
                    nextx = currentx - 2;
                    block_space = 4;
                    card_dir = 'l';
                case 2
                    nextx = currentx + 2;
                    block_space = 2;
                    card_dir = 'r';
                case 3
                    nexty = currenty + 2;
                    block_space = 3;
                    card_dir = 'd';
            end
        case 4
            switch next_dir
                case 1
                    nextx = currentx - 2;
                    block_space = 4;
                    card_dir = 'l';
                case 2
                    nexty = currenty + 2;
                    block_space = 3;
                    card_dir = 'd';
                case 3
                    nexty = currenty - 2;
                    block_space = 1;
                    card_dir = 'u';
            end
    end
else
    
end

end

