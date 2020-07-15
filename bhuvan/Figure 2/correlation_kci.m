function correlation_kci(s)
%Creates new figure
figure()

clear g

% Convert into vector
Corr = s.CorrKCi(:);

% Create New label
label = cell(length(Corr),1);
for i =1:length(Corr)
    label{i,1} = 'Correlation';
end

data = [Corr];

g = gramm('x',label,'y',data);
g.stat_violin('normalization','width','width',0.3);
g.set_names('y','Sterotypy(individual KC response)');
g.axe_property('YGrid','on');
g.draw();
end
