classdef MBON
    properties
        input
        threshold
        output
    end
    methods
        function obj=MBON(input,connectionmatrix,threshold)
            obj.input = input;
            obj.threshold = threshold;
            obj.output = max(0,input'*connectionmatrix-threshold);
        end
            
    end
    
end