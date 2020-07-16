%CALCULATE_STEROTYPY_PN Script Calculates the PN Sterotypy and saves data.

%Start of timer
tic

%Load the simulation data
fprintf('Loading PN data.\n');

load('simulation_data', 'PN_outputs', 'no_of_PN', 'no_of_cycles', 'no_of_individuals', 'no_of_odors');

%Initiazlize variables
fprintf('Initializing variables.\n');

PRED_PN = NaN(nchoosek(no_of_odors,2), no_of_cycles,no_of_PN);
corr_PN = NaN(no_of_cycles, no_of_PN);


%STEREOTYPY CALCULATIONS

%Total PN Sterotypy
fprintf('Calculating Sterotypy of collective PN Response\n');

PRED_total_PN = get_PRED_stereotypy(sum(PN_outputs,3));
corr_total_PN = get_correlation_stereotypy(sum(PN_outputs,3));

%Cell wise PN Sterotypy
fprintf('Calculating Sterotypy of individual PN Response\n');

for cell = 1:no_of_PN
    
    PRED_PN(:,:,cell) = get_PRED_stereotypy(PN_outputs(:,:,cell));
    corr_PN(:,cell) = get_correlation_stereotypy(PN_outputs(:,:,cell));
    
    fprintf('PN sterotypy calculated for cell %d.\n',cell);

end

%Save data
save('PN_sterotypy.mat','PRED_PN','corr_PN','PRED_total_PN','corr_total_PN','-v7.3');

%Display time elapsed
toc
