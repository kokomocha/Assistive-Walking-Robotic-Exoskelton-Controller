function Features = GetFeatures(window_size, D, signals)
    % Creates a feature matrix with mean, min, max from a window of data,
    % from whichever signal names are passed.
    arguments
        window_size double
        D table
        signals string
    end

    % Your code here
    %for i=1:
    %signals()
    Features=[];
    dummy_1=[];
    dummy_2=[];
    dummy_3=[];
    dummy_4=[];

    for j=1:length(signals)
        for i = (window_size+1):length(D.(signals(j)))
            if j==1
                dummy_1(i,:)=[mean((D.(signals(j))((i-window_size):i,:))), max((D.(signals(j))((i-window_size):i,:))),min((D.(signals(j))((i-window_size):i,:))),D.(signals(j))(i-window_size,:)];
            elseif j==2
                dummy_2(i,:)=[mean((D.(signals(j))((i-window_size):i,:))), max((D.(signals(j))((i-window_size):i,:))),min((D.(signals(j))((i-window_size):i,:))),D.(signals(j))(i-window_size,:)];
            elseif j==3
                dummy_3(i,:)=[mean((D.(signals(j))((i-window_size):i,:))), max((D.(signals(j))((i-window_size):i,:))),min((D.(signals(j))((i-window_size):i,:))),D.(signals(j))(i-window_size,:)];
            else
                dummy_4(i,:)=[mean((D.(signals(j))((i-window_size):i,:))), max((D.(signals(j))((i-window_size):i,:))),min((D.(signals(j))((i-window_size):i,:))),D.(signals(j))(i-window_size,:)];
            end
            
        end
        
    end
    Features=[dummy_1,dummy_2,dummy_3,dummy_4];


end
