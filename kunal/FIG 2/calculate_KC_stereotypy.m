%initialize variables
PRED_KC = NaN(4950, 100,2000);
corr_KC = NaN(100, 2000);
%total PN stereotypy calculation
PRED_total_KC = PRED_stereotype(sum(KC_outputs,3));
corr_total_KC = correlation(sum(KC_outputs,3));

%individual PN stereotypy calculation
for unit = 1:2000
    
    PRED_KC(:,:,unit) =PRED_stereotype(KC_outputs(:,:,unit));
    corr_KC(:,unit) = correlation(KC_outputs(:,:,unit));
    
end
