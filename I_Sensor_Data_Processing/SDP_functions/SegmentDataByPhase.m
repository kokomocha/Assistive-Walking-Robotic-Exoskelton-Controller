function [segmented_data] = SegmentDataByPhase(heel_strike_indices, data_to_segment)
    %Segments data by heel strikes. 
    arguments
        heel_strike_indices double
        data_to_segment (:,:) double
    end
  
    %gait_phase = 1:1:100;

    % put your code here
    %HS_d=diff(heel_strike_indices);
    data=zeros(350,ceil(size(data_to_segment,1)/350));
       
    for m=2:size(heel_strike_indices,1)
        data(:,m-1)=data_to_segment(heel_strike_indices(m-1):(heel_strike_indices(m-1)+350-1));
    end
    
    segmented_data=resample(data,101,350);

end