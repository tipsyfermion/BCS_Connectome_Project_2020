function [correlation_stereotype] = correlation(MBON_outputs)
    correlation_stereotype=nan(100,1);
    for iteration=1:100
        matrix=corrcoef(MBON_outputs(:,2*iteration-1),MBON_outputs(:,2*iteration));
        correlation_stereotype(iteration,1)=matrix(2,1);
    end
end