%Plots Violin plot of stereotypy of total KC response.
function stereotypy_totalkc(s)
figure()
clear g
Corr = s.CorrKC(:);
Pred = s.PredKC(:);

label = cell(length(Pred)+length(Corr),1);
for i =1:length(Corr)
    label{i,1} = 'Correlation';
end
for i = 1 + length(Corr):length(Pred) +length(Corr)
    label{i,1} = 'PRED';
end

data = [Corr;Pred];

g = gramm('x',label,'y',data);

g.stat_violin('normalization','width');
g.set_names('y','Sterotypy(total KC response)');
g.axe_property('YGrid','on');
g.draw();
end
