% Creates a class with PN spikes
classdef PN
    properties
    spikes
    end
    
    methods
        function obj=PN(no_pn,no_odor)
            rng(randi(1000000));
            i = randi([0 1],no_pn,no_odor);
            s = randi([10 30],no_pn,no_odor);
            obj.spikes = i.*s;
        end
    end
end
    
    