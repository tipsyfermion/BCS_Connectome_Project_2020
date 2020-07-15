%calculate stereotypy in MBON

fprintf('MBON stereotypy calculation start\n');

%stereotypy calculations
corr_MBON=corr(MBON_spikes_total);
pred_MBON=pred(MBON_spikes_total);

fprintf('MBON stereotypy calculation done\n');
