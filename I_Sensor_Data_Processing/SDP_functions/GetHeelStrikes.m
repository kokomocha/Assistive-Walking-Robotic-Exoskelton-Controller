function HS_idxs = GetHeelStrikes(vertical_force)
    % Uses a threshold on vertical force to calculate heel strike indices
    arguments
        vertical_force (:,1) double
    end

    % put your code here
    HS=zeros(size(vertical_force,1),1);
    HS_idxs=zeros(size(vertical_force,1),1);
    i=1;

    while i < size(vertical_force,1)
        if vertical_force(i,1) < 50
            i=i+1;
        else
            HS(i,1)=1;
            i=i+1;
        end
    end
   
    for j =2:size(vertical_force,1)
        if HS(j,1) > HS(j-1,1)
            HS_idxs(j-1,1)=j;
        else
            continue;
        end
    end
    HS_idxs=nonzeros(HS_idxs);
end