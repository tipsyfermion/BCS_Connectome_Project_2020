%CALCULATE_STEROTYPY_KC Script Calculates the KC Sterotypy and saves data.

%Start of timer
tic

%Load the simulation data
fprintf('Loading PN data.\n');

load('simulation_data', 'KC_outputs', 'no_of_KC', 'no_of_cycles', 'no_of_individuals', 'no_of_odors');

%Initiazlize variables
fprintf('Initializing variables.\n');

PRED_KC = NaN(nchoosek(no_of_odors,2), no_of_cycles,no_of_KC);
corr_KC = NaN(no_of_cycles, no_of_KC);


%STEREOTYPY CALCULATIONS

%Total KC Sterotypy
fprintf('ulating Sterotypy of collective KC Response\n');

PRED_total_KC = get_PRED_stereotypy(sum(KC_outputs,3));
corr_total_KC = get_correlation_stereotypy(sum(KC_outputs,3));


%Cell wise KC Sterotypy
fprintf('Calculating Sterotypy of individual KC Response\n');

for cell = 1:no_of_KC
    
    PRED_KC(:,:,cell) = get_PRED_stereotypy(KC_outputs(:,:,cell));
    corr_KC(:,cell) = get_correlation_stereotypy(KC_outputs(:,:,cell));
    
    %Print report only after every 10th iteration.
    if mod(cell,10) == 0
        fprintf('KC sterotypy calculated for cell %d.\n',cell);
    end
    
end

%Save data
save('KC_sterotypy.mat','PRED_KC','corr_KC','PRED_total_KC','corr_total_KC','-v7.3')

%Display time elapsed
toc
