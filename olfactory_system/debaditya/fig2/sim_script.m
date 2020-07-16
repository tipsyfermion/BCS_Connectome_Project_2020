%SIM_SCRIPT Runs simulation and generates outputs.
tic

%DECLARE VARIABLES
%The number of neurons in each layer
no_of_PN = 50;
no_of_KC = 2000;
no_of_MBON = 1;

%The threshold for the neuron firing rate
neuron_threshold = 119;

%No of Cycles in simulation
no_of_odors = 100;
no_of_cycles = 100;
no_of_individuals = no_of_cycles*2;

%PN_outputs is the PN spike data.
PN_outputs = nan(no_of_odors, no_of_individuals, no_of_PN);
%KC_outputs is the KC spike data. 
KC_outputs = nan(no_of_odors, no_of_individuals, no_of_KC);
%MBON_outputs is the MBON spike data.
MBON_outputs = nan(no_of_odors, no_of_individuals, no_of_MBON);
%START SIMULATION
%Reset Random Generator
rng(0)

%Generate odor and individual seed shifts.
odor_shift = randi(100000000);
individual_shift = randi(100000000);

%Run simulation loop across odors and 
for odor_id = 1:no_of_odors
    for individual_id = 1:no_of_individuals
        
        if mod(individual_id,2) ~= 0
            odor_shift = randi(100000000);
        end
        
        %Record data from single individual and odor into temporary
        %variables.
        [PN_spikes, KC_spikes, MBON_spikes] = run_simulation(odor_shift + odor_id, individual_shift + individual_id, no_of_PN, no_of_KC, no_of_MBON, neuron_threshold);
        
        %Store temporary variable data into final variables.
        PN_outputs(odor_id,individual_id,:) = PN_spikes;
        KC_outputs(odor_id,individual_id,:) = KC_spikes;
        MBON_outputs(odor_id,individual_id,:) = MBON_spikes;
    end
    
    %Clear command window and provide update on status of simulation
    fprintf('Simulation of odor %d done!\n',odor_id);
end

%Delete temporary variables
clear PN_spikes KC_spikes MBON_spikes individual_id odor_id individual_shift odor_shift

%Unloading from memory
save('simulation_data.mat','-v7.3');

clear
%Clear Command window and provide final update.
fprintf('Simulation completed successfully!\n');
memory
toc