function plot_sterotypy_violin(corr,PRED)
    %Convert into vectors
    corr = corr(:);
    PRED = PRED(:);
    
    %Make labels
    label_cells = cell(length(PRED) + length(corr),1);
    for i = 1:length(corr)
        label_cells{i,1} = 'Correlation';
    end
    for i = 1 + length(corr):length(PRED) + length(corr)
        label_cells{i,1} = 'PRED';
    end
    %Combine data
    data = [corr;PRED];
    %Initialize gramm class
    g = gramm('x',label_cells,'y',data);
    
    %Plot gramm violin
    g.stat_violin('normalization','width','width',0.2);
    %DRAW plot
    g.draw();

end
