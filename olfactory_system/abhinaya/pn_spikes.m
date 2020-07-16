function [PN_spikes] = pn_spikes(no_of_PN,seed)
%returns the PN spikes for the 50 PNs

s=rng(seed,'twister');
PN = rand(no_of_PN,1)<=0.5;
PN_spikes = PN.* (randi([10,30],no_of_PN,1)); 
rng(s);
end


