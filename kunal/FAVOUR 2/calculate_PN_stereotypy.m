%initialize variables
PRED_PN = NaN(4950, 100,50);
corr_PN = NaN(100, 50);

%total PN stereotypy calculation
PRED_total_PN = PRED_stereotype(sum(PN_outputs,3));
corr_total_PN = correlation(sum(PN_outputs,3));

%individual PN stereotypy calculation
for unit = 1:50
    
    PRED_PN(:,:,unit) =PRED_stereotype(PN_outputs(:,:,unit));
    corr_PN(:,unit) = correlation(PN_outputs(:,:,unit));
    
end