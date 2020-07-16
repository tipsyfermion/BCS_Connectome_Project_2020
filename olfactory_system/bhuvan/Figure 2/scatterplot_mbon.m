% Plots Scatterplot for PRED and Correlation Stereotypy for MBON responses
function scatterplot_mbon(s)
figure()
scatter(mean(s.PredMbon),s.CorrMbon,'filled');
xlabel('PRED stereotypy');
ylabel('MBON stereotypy');
end