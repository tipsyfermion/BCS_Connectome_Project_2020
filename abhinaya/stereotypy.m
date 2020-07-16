function [PREDstereotypy] = stereotypy(MBON_spikesA, MBON_spikesB)
% Calculates the PRED stereotypy for the MBON response of both individuals
% A and B.
% MBON_spikesA is the MBON response for 1 individual for 100 different
% odors and same for B.

response=[MBON_spikesA';MBON_spikesB'];
no_odors= size(response,2);

ind_pairs=[1 2]; %individual pairs

odor_pairs=nchoosek(1:no_odors,2); %list of possible odor pairs 
no_odor_pairs= size(odor_pairs,1); 

PREDstereotypy=zeros(no_odor_pairs,1); 
for i_odor=1:no_odor_pairs
    PREDstereotypy(i_odor,1)=pairstereotypy(response(ind_pairs(1,:), odor_pairs(i_odor,:)));
end

end
