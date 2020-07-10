function [PN_spikes, KC_spikes, MBON_spikes, PN_KC_mask, KC_MBON_mask ] = run_simulation(odor_seed,individual_seed,no_of_PN, no_of_KC, no_of_MBON,threshold)
%RUN_SIMULATION Runs Single iteration with specific odor and individual id


    %INITIATE SIMULATION
    %Generate PN response to odor based on odor seed, no of PNs with 
    %p(response) = 0.5
    PN_spikes = generate_PN_spikes(odor_seed, no_of_PN, 0.5);
    %Generate PN-KC connection matrix or mask with p(connection) = 0.14
    PN_KC_mask = generate_PN_KC_mask(individual_seed, no_of_PN, no_of_KC, 0.14);
    %Generate KC-MBON connection matrix or mask.
    KC_MBON_mask = generate_KC_MBON_mask(individual_seed, no_of_KC, no_of_MBON, 1000);
    
    
    %RUN SIMULATION
    %Calculate KC cell body sums
    KC_cell_body_sums = PN_KC_mask'*PN_spikes;
    %Apply RELU activation with threshold
    KC_spikes = max(0, KC_cell_body_sums - threshold);
    
    %Calculate MBON cell body sum
    MBON_cell_body_sums = KC_MBON_mask'*KC_spikes;
    %Apply RELU activation with threshold
    MBON_spikes = max(0, MBON_cell_body_sums - threshold);
    
end

function [PN_spikes] = generate_PN_spikes(odor_seed, no_of_PN, probability_of_reaction)
%GENERATE_PN_SPIKES Generate PN response to odor with probability
    
    %Setup randomdata stream with odor_seed
    odor_RandStream = RandStream('mrg32k3a', 'seed', odor_seed);
    
    %Generate random PN_Spikes
    PN_spikes = 20 + odor_RandStream.randi(10, no_of_PN, 1);
    %Generate reaction mask based on probability
    mask = odor_RandStream.rand(no_of_PN, 1) < probability_of_reaction ;
    %Apply mask on spikes.
    PN_spikes = PN_spikes.*mask;
end

function [PN_KC_mask] = generate_PN_KC_mask(individual_seed, no_of_PN, no_of_KC, probability_of_connection)
%GENERATE_PN_KC_MASK Generates PN-KC connection mask

    %Setup randomdata stream with individual_seed
    mask_RandStream = RandStream('mrg32k3a', 'seed', individual_seed);
    %Generate PN-KC mask bsaed on probability
    PN_KC_mask = mask_RandStream.rand(no_of_PN, no_of_KC) < probability_of_connection;
end

function [KC_MBON_mask] = generate_KC_MBON_mask(individual_seed, no_of_KC, no_of_MBON, no_of_connections)
%GENERATE_KC_MBON_MASK Generates KC-MBON connection mask
    
    %Generate mask based on first half of the connections.
    KC_MBON_mask = [ones(no_of_connections,1);zeros(no_of_KC-no_of_connections,1)];
    
    
    %Setup randomdata stream with individual_seed
%    mask_RandStream = RandStream('mrg32k3a', 'seed', individual_seed);
    %Generate KC-MBON mask
%    KC_MBON_mask = zeros(no_of_KC,no_of_MBON);
%    KC_MBON_mask(randsample(mask_RandStream,[1:2000],1000)) = 1;
end

