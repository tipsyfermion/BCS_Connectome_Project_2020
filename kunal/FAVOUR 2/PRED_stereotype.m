function [PREDstereotype]=PRED_stereotype(spikes)
    [no_odor,no_individual]=size(spikes);
    iterations=no_individual/2;
    odor_pairs=nchoosek(1:100,2);
    [no_odor_pairs,~]=size(odor_pairs);
    PREDstereotype=nan(no_odor_pairs,iterations);
    
    for iteration=1:iterations
        for pair=1:no_odor_pairs
        D1 = (spikes(odor_pairs(pair,1),2*iteration-1)-spikes(odor_pairs(pair,1),2*iteration)).^2+(spikes(odor_pairs(pair,2),2*iteration-1)-spikes(odor_pairs(pair,2),2*iteration)).^2;
        D2 = (spikes(odor_pairs(pair,1),2*iteration-1)-spikes(odor_pairs(pair,2),2*iteration)).^2+(spikes(odor_pairs(pair,2),2*iteration-1)-spikes(odor_pairs(pair,1),2*iteration)).^2;
        PREDstereotype(pair,iteration) =(D2-D1)/(D2+D1);
        end
    end
end