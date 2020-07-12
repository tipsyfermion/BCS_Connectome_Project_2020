%CALCULATE_STEROTYPY_MBON Script Calculates the MBON Sterotypy and saves data.

%Start of timer
tic

%Load the simulation data
fprintf('Loading PN data.\n');

load('simulation_data', 'MBON_outputs', 'no_of_MBON', 'no_of_cycles', 'no_of_individuals', 'no_of_odors');

%STEREOTYPY CALCULATIONS

%MBON Sterotypy
fprintf('Calculating Stereotypy of MBONs\n');

PRED_MBON = get_PRED_stereotypy(MBON_outputs);
corr_MBON = get_correlation_stereotypy(MBON_outputs);

%Save data
save('MBON_sterotypy.mat','PRED_MBON','corr_MBON','-v7.3')

%Display time elapsed
toc
