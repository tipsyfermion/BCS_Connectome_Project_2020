function stereotypy_scatterplot(corr_MBON,PRED_MBON)
   
    avg_PRED = mean(PRED_MBON,1);
    
    g = gramm('x',avg_PRED,'y',corr_MBON);
    g.geom_point();
    
    g.set_title('Avg PRED Sterotypy vs Correlation Stereotypy');
    g.set_names('x','PRED Stereotypy (MBON Response)','y','Correlation Sterotypy (MBON Response)');
    g.axe_property('XGrid','on','YGrid','on');
    
    g.draw();
    
end