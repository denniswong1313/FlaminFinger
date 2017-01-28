clear
clc
finished = 0;
while (finished == 0)
    path = zeros(101,101);
    currentx = 2;
    currenty = 100;
    path(currenty+1,currentx) = 1;
    currentx_stored = currentx;
    currenty_stored = currenty;
    path(currenty,currentx) = 1;
    isTrapped = 0;
    block_space = 1;
    block_space_history = zeros(5,1);
    %    3
    %  2 C 4
    %    1
    card_dir_stored = 'u';
    card_dir = 'u';
    count = 0;

    lneighbor = 0;
    uneighbor = 0;
    rneighbor = 0;
    dneighbor = 0;

    while (finished == 0)
        isTrapped = amITrapped(path, currenty, currentx);
        % Experimental double while loop
        if (isTrapped == 1)
            break
        end

        [next_dir, currentx, currenty, card_dir, block_space] = riggedRandom(block_space,isTrapped,currentx,currenty);

        if (currentx < 1)
            currentx = currentx_stored;
            card_dir = card_dir_stored;
            continue
        end

        if (currenty > size(path,1))
            currenty = currenty_stored;
            card_dir = card_dir_stored;
            continue
        end

        if (currentx > size(path,1) || currenty < 1)
            if (currentx > (size(path,1)))
                path(currenty,currentx-1) = 1;
            end
            
            if (currenty < 1)
                path(currenty+1,currentx) = 1;
            end
            
            finished = 1;
            continue
        end

        if (path(currenty,currentx) > 0)
            count = count + 1;
            currentx = currentx_stored;
            currenty = currenty_stored;
            continue
        else
            if (strcmp(card_dir,'l'))
                safex = currentx;
                safey = currenty;
                unsafecount = 1;
            end

            path(currenty,currentx) = 1;
            card_dir_stored = card_dir;
            currentx_stored = currentx;
            currenty_stored = currenty;
            block_space_history = circshift(block_space_history,[1,1]);
            block_space_history(1) = block_space;
            switch card_dir
                case 'l'
                    path(currenty,currentx+1) = 1;
                case 'u'
                    path(currenty+1,currentx) = 1;
                case 'r'
                    path(currenty,currentx-1) = 1;
                case 'd'
                    path(currenty-1,currentx) = 1;
            end
        end

    end 
end
border = drawBorder(path);
figure;
subplot(1,2,1);
imshow(path);
subplot(1,2,2);
imshow(border);