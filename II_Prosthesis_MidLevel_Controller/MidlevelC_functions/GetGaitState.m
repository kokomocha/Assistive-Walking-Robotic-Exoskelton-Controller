function R_GaitState = GetGaitState(D)
    % Takes in data and returns right leg gait state based on heuristics

    R_GaitState = zeros(size(D.Time,1),1);
    R_current_state = 1; % Assume gait state is 1 at the beginning of the file
    R_GaitState(1,1) = R_current_state ;

    Force_Threshold = 40;
    Ankle_Angle_Threshold = 18;
    
    % Stance Flexion    = 1
    % Pre-Swing         = 2
    % Swing Flexion     = 3
    % Swing Extension   = 4 

    for  i=2:size(D.Time,1)
        if (D.R_F(i,3)>D.R_F(i-1,3))&&(D.R_F(i,3)>Force_Threshold)&&(D.R_Ankle_Angle(i,1)<Ankle_Angle_Threshold)
            R_current_state = 1;
        elseif (D.R_F(i,3)>Force_Threshold)&&(D.R_F(i,3)>D.R_F(i-1,3))
            R_current_state = 2;
                        
        elseif (D.R_F(i,3)<Force_Threshold)&&(D.R_Knee_Velocity(i,1)<0)
            R_current_state = 3;
            if R_current_state<R_GaitState(i-1,1) && (R_GaitState(i-1,1)==4)
                R_current_state = R_GaitState(i-1,1);
            end
        elseif (D.R_Knee_Velocity(i,1)>D.R_Knee_Velocity(i-1,1))&&(D.R_F(i,3)<Force_Threshold)&&(D.R_Knee_Angle(i,1)>D.R_Knee_Angle(i-1,1))
            R_current_state = 4;
        end
        R_GaitState(i,1)= R_current_state;
    end
end
