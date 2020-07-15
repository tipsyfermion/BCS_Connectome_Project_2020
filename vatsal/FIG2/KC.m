classdef KC 
   % KC class
   %generates KC spikes and the KC_MBON_connection matrix 
    properties
        no_of_KC
        KC_threshold
        PN_spikes
        PN_KC_connection
        num
    end
    
    properties(Dependent)
        KC_spikes
        KC_MBON_connection
       
    end
    
    methods
        function obj=KC(n,t,ps,pk,num)
            obj.no_of_KC=n;
            obj.KC_threshold=t;
            obj.PN_spikes=ps;
            obj.PN_KC_connection=pk;
            obj.num=num;
            
        end
        
        function KC_spikes=get.KC_spikes(obj)
            %KC input
            sum=(obj.PN_KC_connection)'*obj.PN_spikes;
            % KC response or KC output
            KC_spikes=max(0,sum-obj.KC_threshold);
            
        end
        
        function KC_MBON_connection=get.KC_MBON_connection(obj)
            % only the first [num] KCs will send response to MBON
            KC_MBON_connection=[ones(obj.num,1);zeros(obj.no_of_KC-obj.num,1)];
            
        end
    end
end