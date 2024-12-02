function ankle_torque = CalculateAnkleTorque(Fy, Fz, L, H)
    %   CalculateAnkleAngle Uses markers to calculate ankle angle
    arguments
        Fy (:,1) double
        Fz (:,1) double
        L double
        H double
    end

    % Put your code here
    %Conventions: Dorsiflexion Torque positive
    %
    ankle_torque=(Fz.*L)-(Fy.*H);

end