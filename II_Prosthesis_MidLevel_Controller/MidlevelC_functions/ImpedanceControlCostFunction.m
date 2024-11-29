function error = ImpedanceControlCostFunction(impedance_params_to_evaluate, ...
        gait_state, angle, velocity, biological_torque)
    % calculates actuator torque from the impedance_params and returns
    % error in RMSE

    % Your code here
    actuatorTorque = ImpedanceController(impedance_params_to_evaluate,gait_state,angle,velocity);
    error=rmse(actuatorTorque,biological_torque);
    %error=fitlm(actuatorTorque,biological_torque).RMSE;

end