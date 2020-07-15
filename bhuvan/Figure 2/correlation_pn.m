% Plots Correlation stereotypy between PN response of 2 individuals
function correlation_pn(s)
figure()
i = randi(100);
PN = s.PN(:,:,i)';
CorrPN = corrcoef(PN);

pcolor(CorrPN);
xlabel('PNs in individual A');
ylabel('PNs in individual B');
colorbar();
caxis([-1,1]);

end