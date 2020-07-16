%getting the total response of PN,KC and MBON

%creating empty matrices
PN_spikes_total=nan(100,200,50);
KC_spikes_total=nan(100,200,2000);
MBON_spikes_total=nan(100,200,1);

rng(1)

%generating random base seeds
base_odor_seed=randi(500000000);
base_individual_seed=randi(500000000);

% 2 individuals, 100 iterations, 100 odors
for individual = 1:2
    for iteration = 1:100
        for odor = 1:100 
            %calling PN,KC,MBON classes
            
            % base_individual_seed + individual to get  the same
            % PN_KC_connection matrix for a individual in all the iterations
            target_PN=PN(50,.5,base_odor_seed + odor + iteration, base_individual_seed + individual);
            target_KC=KC(2000,119,target_PN.PN_spikes,target_PN.PN_KC_connection,1000);
            target_MBON=MBON(1,119,target_KC.KC_MBON_connection,target_KC.KC_spikes);
            
            %getting values
            PN_spikes_total(odor,iteration + (individual-1)*100,:) = target_PN.PN_spikes;
            KC_spikes_total(odor,iteration + (individual-1)*100,:) = target_KC.KC_spikes;
            MBON_spikes_total(odor,iteration + (individual-1)*100,:) = target_MBON.MBON_spikes;
        end
    end
    fprintf('individual %d done\n',individual);
end

%stereotypy for PN response
corr_PN_ind=nan(100,50);
for ind = 1:50
    corr_PN_ind(:,ind) = corr(PN_spikes_total(:,:,ind));
end




