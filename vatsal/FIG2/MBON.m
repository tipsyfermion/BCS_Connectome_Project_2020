classdef MBON
    % MBON class
    % generates MBON spikes
    properties
        no_of_MBON
        MBON_threshold
        KC_MBON_connection
        KC_spikes
    end
    
    properties(Dependent)
        MBON_spikes
        
    end
    
    methods
        function obj=MBON(n,t,c,k)
            obj.no_of_MBON=n;
            obj.MBON_threshold=t;
            obj.KC_MBON_connection=c;
            obj.KC_spikes=k;
        end
        
        function MBON_spikes=get.MBON_spikes(obj)
            % MBON input
            sum=(obj.KC_MBON_connection)'*obj.KC_spikes;
            % MBON response
            MBON_spikes=max(0,sum-obj.MBON_threshold);
        end
    end
end