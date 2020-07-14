MBON_outputs = nan(100,200,1);
PN_outputs = nan(100,200,50);
KC_outputs = nan(100,200,2000);


for seed_odor=1:100
    for iteration = 1:200
        if rem(iteration,2)==1
            odor_shift = randi(100000);
        end
        [PN_spikes, KC_spikes, MBON_spikes] = simulate_odor_response(seed_odor+odor_shift,iteration,50,2000);
        
        PN_outputs(seed_odor,iteration,:)=PN_spikes;
        KC_outputs(seed_odor,iteration,:)=KC_spikes;
        MBON_outputs(seed_odor,iteration,:)=MBON_spikes;
        
    end
end