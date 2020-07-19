function [PN_KC_CONNECTION] = G_PN_KC(individual_seed, no_PN, no_KC, probability)
%GENERATE PN-KC connection
    %Setup randomdata stream with individual_seed
    if rem(individual_seed,2)
        connection_RandStream = RandStream('mrg32k3a', 'seed',100);
        %Generate PN-KC mask bsaed on probability
        PN_KC_CONNECTION = connection_RandStream.rand(no_PN, no_KC) < probability;
    else
        connection_RandStream = RandStream('mrg32k3a', 'seed',200);
        %Generate PN-KC mask bsaed on probability
        PN_KC_CONNECTION = connection_RandStream.rand(no_PN, no_KC) < probability;
        
end