function [feature_matrix, labels] = GetFeatures(indices, window_size, D_all, signals)
    % Creates a feature matrix with mean, min, max from a window of data,
    % from whichever signal names are passed.
    % tip: taking the mean/max/min of an n x m matrix is a 1 x m vector 
    arguments
        indices (1, :) double
        window_size double
        D_all table
        signals string
    end

    feature_matrix = [];
    labels = [];

    % your code here
    for i = 1:length(indices)
        current_idx = indices(i);
        IMU_data(end+1, :) = D_all.R_Accel(current_idx,:);
        labels(end+1, :) = D_all.RampAngle(current_idx);
    end


    end