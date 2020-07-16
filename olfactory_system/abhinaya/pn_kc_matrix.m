function [PN_KC_matrix] = pn_kc_matrix(no_of_PN,no_of_KC,seed)
%Generates the PN KC connection matrix
%if odor=="diff" && ind=="same" then pnkcmatrix will be same

s=rng(seed,'twister'); 
PN_KC_matrix = zeros(no_of_PN,no_of_KC);
n=(0.14*no_of_PN*no_of_KC);
n=int64(n);
PN_KC_matrix(randperm(numel(PN_KC_matrix),n))=1;
rng(s); %restoring the random generator
end

