function correlation_stereotypy = corr(output)
    correlation_stereotypy=nan(100,1);
    for iteration = 1:100
        correlation_matrix=corrcoef(output(:,iteration),output(:,iteration+100));
        correlation_stereotypy(iteration)=correlation_matrix(2,1);
end