function [PN_spikes, KC_spikes, MBON_spikes] = simulate_odor_response(seed_odor,individual_seed,no_PN, no_KC)
    PN_spikes = G_Pspikes(seed_odor,no_PN,0.5);
    PN_KC_CONNECTION = G_PN_KC(individual_seed,no_PN,no_KC,0.14);
    KC_MBON_CONNECTION = G_KC_MBON(no_KC);

    sum= PN_KC_CONNECTION'*PN_spikes;
    KC_spikes = max(0, sum - 119);
    MBON_sums = KC_MBON_CONNECTION'*KC_spikes;
    MBON_spikes = max(0, MBON_sums - 119);
end
