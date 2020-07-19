%MBON_outputs is the MBON spike data.
MBON_outputs = nan(100,200,1);
%PN_outputs is the PN spike data.
PN_outputs = nan(100,200,50);
%MBON_outputs is the MBON spike data.
KC_outputs = nan(100,200,2000);

%Run simulation loop across odors
for seed_odor=1:100
    for iteration = 1:200
        if rem(iteration,2)==1
            %Generate odor shift after each odor given to 2 individuals
            odor_shift = randi(100000);
        end
        [PN_spikes, KC_spikes, MBON_spikes] = simulate_odor_response(seed_odor+odor_shift,iteration,50,2000);
        
        %Store data into output variables.
        PN_outputs(seed_odor,iteration,:)=PN_spikes;
        KC_outputs(seed_odor,iteration,:)=KC_spikes;
        MBON_outputs(seed_odor,iteration,:)=MBON_spikes;
        
    end
end