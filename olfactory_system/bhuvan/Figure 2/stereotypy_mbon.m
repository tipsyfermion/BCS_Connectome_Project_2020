% Plots the violin plot for MBON Stereotypy
function stereotypy_mbon(s)
%Creates new figure
figure()

clear g

% Convert into vector
Corr = s.CorrMbon(:);
Pred = s.PredMbon(:);

% Create New label
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
g.set_names('y','Sterotypy(MBON response)');
g.axe_property('YGrid','on');
g.draw();
end
