function [correlation] = correlation(MBON_spikesA,MBON_spikesB)
%Calculates the correlation for the MBON response of both individuals
% A and B.
% MBON_spikesA is the MBON response for 1 individual for 100 different
% odors and same for B.

response=[MBON_spikesA';MBON_spikesB'];

no_inds=size(response,1);

ind_pairs=nchoosek(1:no_inds,2);
no_ind_pairs=size(ind_pairs,1); %1 pair of individuals, here.

correlation=zeros(no_ind_pairs,1);
for i_ind=1:no_ind_pairs
    correlation(i_ind)=corr(response(ind_pairs(i_ind,1),:)',response(ind_pairs(i_ind,2),:)');
end

end