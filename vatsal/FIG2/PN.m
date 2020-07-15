classdef PN
    %PN class
    %geneartes PN_spikes and the PN_KC_connection matrix
    
    properties
        no_of_PN
        reaction_probiblity
        PN_seed_odor
        PN_seed_individual
    end
    
    properties(Dependent)
        PN_spikes
        PN_KC_connection
    end
    
    methods
        function obj=PN(n,p,s1,s2)
            obj.no_of_PN=n;
            obj.reaction_probiblity=p;
            obj.PN_seed_odor=s1;
            obj.PN_seed_individual=s2;
        end
        
        function PN_spikes=get.PN_spikes(obj)
            %generating a localstream to get PN_spikes
            localstream=RandStream('mrg32k3a','seed',obj.PN_seed_odor);
            %generating the probiblity matrix
            prob_matrix=localstream.rand(obj.no_of_PN,1) < obj.reaction_probiblity;
            %getting response of all the PNs
            PN_spikes=(localstream.randi([10,30],obj.no_of_PN,1)).*prob_matrix;
            
        end
        
        function PN_KC_connection=get.PN_KC_connection(obj)
             %generating a localstream to get PN_KC_connection matrix
            localstream=RandStream('mrg32k3a','seed',obj.PN_seed_individual);
            % random connection matrix between PN and KC
            PN_KC_connection=localstream.rand(obj.no_of_PN,2000) < .14;
        end
        
    end
end