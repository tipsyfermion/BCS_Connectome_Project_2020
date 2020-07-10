function [PN_spikes] = generate_PN_spikes(odor_seed, no_of_PN, probability_of_reaction)
%GENERATE_PN_SPIKES Returns PN_spikes based on odor_seed.

    odor_RandStream = RandStream('mrg32k3a', 'seed', odor_seed);            %Setup random generator with odor_seed
    PN_spikes = 20 + odor_RandStream.randi(10, no_of_PN, 1);                %Generate random PN_spikes for all neurons
    mask = odor_RandStream.rand(no_of_PN, 1) < probability_of_reaction ;    %Generate random connection mask based on probability_of_reaction;
    PN_spikes = PN_spikes.*mask;                                            %Apply maks on PN_spikes
    
end