function [KC_spikes] = kc_spikes(PN_KC_matrix,PN_spikes)
%Generates the KC spikes 
KC_input= (PN_KC_matrix')* PN_spikes;
KC_spikes=max(0,KC_input-119); %standard rectifier function with t=119
end

