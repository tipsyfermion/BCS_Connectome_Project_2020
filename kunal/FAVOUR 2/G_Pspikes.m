function [PN_spikes] =G_Pspikes(seed_odor,no_PN,probability)
%GENERATE_PN_SPIKES Generate PN response to odor with probability
    
    %Setup randomdata stream with seed_odor
    odor_RandStream = RandStream('mrg32k3a', 'seed', seed_odor);
    %Generate random PN_Spikes
    PN_spikes = odor_RandStream.randi([10,30], no_PN, 1);
    %Generate reaction connection based on probability
    connection = odor_RandStream.rand(no_PN, 1) < probability ;
    %Apply connection on spikes
    PN_spikes = PN_spikes.*connection;
end