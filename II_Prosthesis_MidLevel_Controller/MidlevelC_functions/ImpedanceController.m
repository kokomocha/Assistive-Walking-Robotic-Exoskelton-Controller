function torque = ImpedanceController(impedance_params, gait_state, angle, velocity)
    % Uses gait state and the impedance params to determine the actuator
    % torque.

    arguments
        impedance_params (1,12) double
        gait_state (:,1) double
        angle (:,1) double
        velocity (:,1) double
    end

    % your code here
    torque=zeros(size(gait_state,1),1);
    impedance_params=reshape(impedance_params,4,3);
    for i=1:size(gait_state,1) 
        torque(i,1) = -1*(impedance_params(gait_state(i,1),1)*(angle(i,1)-impedance_params(gait_state(i,1),3))+impedance_params(gait_state(i,1),2)*velocity(i,1));
    end
    
end 