function HS_idxs = DetectHeelStrikesIMU(gyro_x)
    % Uses a threshold on vertical force to calculate heel strike indices
    arguments
        gyro_x (:,1) double
    end

    % Your Code here

    HS_idxs=[];
    
    fc=10; %Cutoff frequency
    fs=1200;%Sampling frequency
    [b,a] = butter(2,fc/(fs/2),'low'); %2nd order, 10 Hz, zero-lag low-pass

    %plot unfiltered data vs filtered data 
    filtered_gyro_x = filtfilt(b,a, gyro_x);
    angle_threshold=0.85*max(filtered_gyro_x);%stride-dependent threshold for individual
    figure;
    hold on;
    plot(gyro_x);
    plot(filtered_gyro_x)
    legend("Gyro X Signal","filtered Gyro X Signal")
    xlabel('Data Index')
    ylabel('Angular Velocity (degree/s)')
    xlim([2727 5396])
    ylim([-197 370])
    hold off;

    figure;
    plot(filtered_gyro_x)

    for i=2:length(filtered_gyro_x)-1
        if filtered_gyro_x(i)>angle_threshold
            if filtered_gyro_x(i-1)<filtered_gyro_x(i) && filtered_gyro_x(i)>filtered_gyro_x(i+1)
                HS_idxs(end+1)=i;
                pause(0.05)
            end
        end
    end


end