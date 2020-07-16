classdef neuron
    %NEURON This is a neuron class that shows the 
    %   Detailed explanation goes here
    
    properties
        no_of_input_connections;
        weights;
        bias;
        threshold;
    end
    
    methods
        function obj = neuron(i,w,b,t)
            %NEURON Constructor
            obj.no_of_input_connections = i;
            obj.weights = w;
            obj.bias = b;
            obj.threshold = t;
        end
        
        function output = getOutput(obj,inputs)
            %OUTPUT Produces the output of the neuron
            cell_body_sum = sum((inputs'*obj.weights) + obj.bias);
            output = max(0,cell_body_sum - obj.threshold);
        end
    end
end

