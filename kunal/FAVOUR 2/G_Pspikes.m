function [PN_spikes] =G_Pspikes(seed_odor,no_PN,probability)
    odor_RandStream = RandStream('mrg32k3a', 'seed', seed_odor);
    PN_spikes = odor_RandStream.randi([10,30], no_PN, 1);
    connection = odor_RandStream.rand(no_PN, 1) < probability ;
    PN_spikes = PN_spikes.*connection;
end