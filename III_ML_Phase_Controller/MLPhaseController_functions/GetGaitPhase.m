function gait_phase = GetGaitPhase(time, heel_strike_indices)
    % Uses the time vector and heel strike indices to calculate gait phase.
    arguments
        time (:,1) double
        heel_strike_indices (1,:) double
    end

    % Code here
    gait_phase = NaN(size(time,1),1);
    g=[];
    for i = 2:length(heel_strike_indices)
        d=time(heel_strike_indices(i-1):heel_strike_indices(i));      
        for j=1:length(d)-1
            g(end+1) =  100*(d(j)-time(heel_strike_indices(i-1)))/(time(heel_strike_indices(i)) -  time(heel_strike_indices(i-1)));
        end
    end
    gait_phase(heel_strike_indices(1):heel_strike_indices(end)-1) = g';
    

end