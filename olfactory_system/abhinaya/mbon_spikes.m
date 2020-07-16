function [MBON_spikes] = mbon_spikes(KC_MBON_matrix,KC_spikes)
%Generates the value for the MBON spike
MBON_input=(KC_MBON_matrix')*(KC_spikes);
MBON_spikes=max(0,MBON_input-119); %standard rectifier function with t=119
end

