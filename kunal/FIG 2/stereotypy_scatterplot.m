function stereotypy_scatterplot(corr_MBON,PRED_MBON)
%stereotypy_scatterplot plots the a scatter plot of the PRED and corr sterotypy.
    %Calculate mean of PRED
    avg_PRED = mean(PRED_MBON,1);
    %Initialize gramm class
    g = gramm('x',avg_PRED,'y',corr_MBON);
    %Plot gramm scatter
    g.geom_point();
    
    %setting title
    g.set_title('Avg PRED Sterotypy vs Correlation Stereotypy');
    %setting axis names
    g.set_names('x','PRED Stereotypy (MBON Response)','y','Correlation Sterotypy (MBON Response)');
    %setting grids
    g.axe_property('XGrid','on','YGrid','on');
    
    %Draw plot
    g.draw();
    
end