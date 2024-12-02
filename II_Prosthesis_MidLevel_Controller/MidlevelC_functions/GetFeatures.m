function [feature_matrix, labels] = GetFeatures(indices, window_size, D_all, signals)
    % Creates a feature matrix with mean, max, min from a window of data,
    % from whichever signal names are passed.
    % tip: taking the mean/max/min of an n x m matrix is a 1 x m vector 
    arguments
        indices (1, :) double
        window_size double
        D_all table
        signals string
    end

    feature_matrix = zeros(length(indices),9);

    % your code here
    for i = 1:length(indices)
        dummy1 = table2array(mean(D_all((indices(:,i)-window_size):indices(:,i),signals(:,1))));
        dummy2 = table2array(max(D_all((indices(:,i)-window_size):indices(:,i),signals(:,1))));
        dummy3 = table2array(min(D_all((indices(:,i)-window_size):indices(:,i),signals(:,1))));
        feature_matrix(i,:)=[dummy1,dummy2,dummy3];
    end  
    labels = table2array(D_all(indices, signals(:,2)));

    end