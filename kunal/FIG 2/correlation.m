function [correlation_stereotype] = correlation(MBON_outputs)
%correlation provides a matrix with correlation values.
    %Create empty stereotypy matrix.
    correlation_stereotype=nan(100,1);
    %Run loop for sterotypy iterations.
    for iteration=1:100
        matrix=corrcoef(MBON_outputs(:,2*iteration-1),MBON_outputs(:,2*iteration));
        %Calculate correlation_stereotype
        correlation_stereotype(iteration,1)=matrix(2,1);
    end
end