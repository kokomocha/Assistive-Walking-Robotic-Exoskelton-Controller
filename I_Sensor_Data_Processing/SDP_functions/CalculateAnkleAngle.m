function ankle_angle = CalculateAnkleAngle(knee_marker, ankle_marker, toe_marker, heel_marker)
    % CalculateAnkleAngle uses markers to calculate ankle angle
    % Remember: only use the sagittal plane coordinates (y, z)
    
    arguments (Input)
        knee_marker (:,3) double
        ankle_marker (:,3) double
        toe_marker (:,3) double
        heel_marker (:,3) double
    end

    % Put your code here
    %"Norm" function is used to get the magnitude of cross product of vectors representing shank and foot.
    % Note that norm of cross product gives the y-component(sin) and the dot product gives x-component(cos).
    

    %shank_angle=zeros(size(knee_marker,1),1)//Not used
    %foot_angle=zeros(size(knee_marker,1),1)//Not used
    ankle_angle=zeros(size(knee_marker,1),1);

    for i=1:size(knee_marker,1)
        K=[knee_marker(i,2) knee_marker(i,3) 0] ;
        A=[ankle_marker(i,2) ankle_marker(i,3) 0];
        T=[toe_marker(i,2) toe_marker(i,3) 0];
        H=[heel_marker(i,2) heel_marker(i,3) 0];
        v1= K-A;
        v2= H-T;
        ankle_angle(i,1)=([atan2(norm(cross(v2,v1)),dot(v2,v1))]*180/pi)-90;
    end
    %There may be some outliers as the dorsiflexion angle is going upto 26 degrees    
    %There may be some outliers as the plantarflexion angle is going upto -20 degrees
end
   