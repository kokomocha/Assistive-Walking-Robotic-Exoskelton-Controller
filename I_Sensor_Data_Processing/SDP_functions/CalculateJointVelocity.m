function velocity = CalculateJointVelocity(angle, fs, do_filter)
    % Takes the time derivative of the angle input
    
    % TIP: You can specify a default value for an argument so that is
    % doesn't need to be passed. In this instance, I have set the do_filter
    % default value to false.
    arguments
        angle (:,1) double          
        fs double                   % sampling frequency
        do_filter logical = false   % default = false
    end

    % Put your code here
    a=angle*pi/180;
    aa=diff(a); 

    while do_filter 
        [b,a] = butter(4, (fs/2)/fs, 'low');
        velocity= filtfilt(b, a, aa);
        do_filter = false;
    end

end