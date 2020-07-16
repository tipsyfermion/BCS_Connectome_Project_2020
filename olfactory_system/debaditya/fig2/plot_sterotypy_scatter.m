function plot_sterotypy_scatter(corr,PRED)
%PLOT_STEROTYPY_SCATTER plots the a scatter plot of the PRED and corr sterotypy.
   
    %New figure
    figure();
    
    %Calculate mean of PRED
    avg_PRED = mean(PRED,1);
    
    %Initialize gramm class
    g = gramm('x',avg_PRED,'y',corr);
    
    %Plot gramm scatter
    g.geom_point();
    
    %Formatting
    g.set_names('x','PRED Stereotypy (MBON Response)','y','Correlation Sterotypy (MBON Response)');
    g.set_title('Avg PRED Sterotypy vs Correlation Stereotypy','FontSize',12);
    g.axe_property('YGrid','on','XGrid','on');
    
    %Draw plot
    g.draw();
    
end

