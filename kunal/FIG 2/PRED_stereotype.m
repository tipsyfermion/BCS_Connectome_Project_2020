function [PREDstereotype]=PRED_stereotype(spikes)
%PRED_stereotype Returns the PRED based sterotypy for spikes
    %Get no of odors and no of individuals.
    [no_odor,no_individual]=size(spikes);
    %Get no of pairs of individuals.
    iterations=no_individual/2;
    %Get all possible pairs of combinations of odors for PRED.
    odor_pairs=nchoosek(1:100,2);
    %Get no of combinations.
    [no_odor_pairs,~]=size(odor_pairs);
    %Generate variable which is empty
    PREDstereotype=nan(no_odor_pairs,iterations);
    
    %Run loop for sterotypy iterations 
    for iteration=1:iterations
        for pair=1:no_odor_pairs
        %calculate D1
        D1 = (spikes(odor_pairs(pair,1),2*iteration-1)-spikes(odor_pairs(pair,1),2*iteration)).^2+(spikes(odor_pairs(pair,2),2*iteration-1)-spikes(odor_pairs(pair,2),2*iteration)).^2;
        %calculate D2
        D2 = (spikes(odor_pairs(pair,1),2*iteration-1)-spikes(odor_pairs(pair,2),2*iteration)).^2+(spikes(odor_pairs(pair,2),2*iteration-1)-spikes(odor_pairs(pair,1),2*iteration)).^2;
        %Calculate PRED
        PREDstereotype(pair,iteration) =(D2-D1)/(D2+D1);
        end
    end
end