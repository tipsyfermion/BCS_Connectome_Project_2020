function [PN_spikes, KC_spikes, MBON_spikes] = simulate_odor_response(seed_odor,individual_seed,no_PN, no_KC)
 %INITIATE SIMULATION
    %Generate PN response to odor based on odor seed, no of PNs with 
    %p(response) = 0.5
    PN_spikes = G_Pspikes(seed_odor,no_PN,0.5);
    %Generate PN-KC connection matrix with p(connection) = 0.14
    PN_KC_CONNECTION = G_PN_KC(individual_seed,no_PN,no_KC,0.14);
    %Generate KC-MBON connection matrix
    KC_MBON_CONNECTION = G_KC_MBON(no_KC);

    %RUN SIMULATION
    %Calculate KC cell body sums
    sum= PN_KC_CONNECTION'*PN_spikes;
    %Apply RELU activation with threshold(119)
    KC_spikes = max(0, sum - 119);
    %Calculate MBON cell body sum
    MBON_sums = KC_MBON_CONNECTION'*KC_spikes;
    %Apply RELU activation with threshold(119)
    MBON_spikes = max(0, MBON_sums - 119);
end
