%calculate stereotypy in KC

%stereotypy calculation for TOTAL KC response
fprintf('KC total stereotypy calculation start\n');

%create 2 empty matrices
corr_KC_total=nan(100,1);
pred_KC_total=nan(4950,100);

%calculations
corr_KC_total=corr(sum(KC_spikes_total,3));
pred_KC_total=pred(sum(KC_spikes_total,3));

fprintf('KC total stereotypy calculation done\n');

%stereotypy calculation for INDIVIDUAL KC response
fprintf('KC individual stereotypy calculation start\n');

%create 2 empty matrices
corr_KC_ind=nan(100,2000);
%pred_KC_ind=nan(4950,100,2000);

%calculations
for ind = 1:2000
    corr_KC_ind(:,ind) = corr(KC_spikes_total(:,:,ind));
    %pred_KC_ind(:,:,ind) = pred(KC_spikes_total(:,:,ind));
end

fprintf('KC individual stereotypy calculation done\n');


