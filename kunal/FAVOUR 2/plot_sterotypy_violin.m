function plot_sterotypy_violin(corr,PRED)

    corr = corr(:);
    PRED = PRED(:);
    
    label_cells = cell(length(PRED) + length(corr),1);
    for i = 1:length(corr)
        label_cells{i,1} = 'Correlation';
    end
    for i = 1 + length(corr):length(PRED) + length(corr)
        label_cells{i,1} = 'PRED';
    end
    
    data = [corr;PRED];
  
    g = gramm('x',label_cells,'y',data);
    
    g.stat_violin('normalization','width','width',0.2);
    g.draw();

end
