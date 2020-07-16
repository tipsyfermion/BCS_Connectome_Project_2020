classdef network
    %NETWORK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        no_of_PN;
        no_of_KC;
        no_of_MB;
        PN_KC_mask;
        KC_MB_mask;
    end
    
    methods
        function obj = network(inputArg1,inputArg2)
            %NETWORK Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

