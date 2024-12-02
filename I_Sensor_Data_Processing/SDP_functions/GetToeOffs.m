function TO_idxs = GetToeOffs(vertical_force)
    % Uses a threshold on vertical force to calculate toe off indices
    arguments
        vertical_force (:,1) double
    end
    
    % put your code here
    TO=zeros(size(vertical_force,1),1);
    TO_idxs=zeros(size(vertical_force,1),1);
    i=1;

    while i < size(vertical_force,1)
        if vertical_force(i,1) < 50
            i=i+1;
        else
            TO(i,1)=1;
            i=i+1;
        end
    end

    for j =2:size(vertical_force,1)
        if TO(j,1) < TO(j-1,1)
            TO_idxs(j-1,1)=j;
        else
            continue;
        end
    end
    TO_idxs=nonzeros(TO_idxs);
end