% Class with all properties of KC
classdef KC
    properties
        input
        connectionmatrix
        threshold
        output
    end
    
    methods
        function obj=KC(input,connectionmatrix,threshold)
        obj.input = input;
        obj.connectionmatrix = connectionmatrix;
        obj.threshold = threshold;
        i = input;
        obj.output = max(0,connectionmatrix'*i-threshold);
        end
    end
end