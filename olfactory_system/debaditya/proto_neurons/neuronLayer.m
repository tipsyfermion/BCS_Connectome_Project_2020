classdef neuronLayer
    %NEURONLAYER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        no_of_neurons;
        no_of_inputs;
        weights;
        bias;
        thresholds;
    end
    
    methods
        function obj = neuronLayer(n,i,w,b,t)
            %NEURONLAYER Constructor
            obj.no_of_neurons = n;
            obj.no_of_inputs = i;
            obj.weights = w; %w dimentions 2000x50,
            obj.bias = b;
            obj.thresholds = t;
        end
        
        function output = getOutput(obj,inputs)
            %GETOUTPUT Input dimentions must be a vector of size 50
            cell_body_sums = sum(obj.weights*inputs + obj.bias);
        end
    end
end

