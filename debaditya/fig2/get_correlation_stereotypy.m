function [stereotypy] = get_correlation_stereotypy(spikes)
%GET_CORRELATION_STEREOTYPY provides a matrix with correlation values.
    

    %INITIALIZATION
    %Get to know number of individuals.
    [~, no_indi] = size(spikes);
    %Calculate no of iterations = no of pairs of individuals.
    iterations = no_indi/2;
    %Create empty stereotypy matrix.
    stereotypy = nan(iterations,1);
    
    
    %MAIN LOOP
    %Run sterotypy iterations.
    for iteration = 1:iterations
        %Calculate correlation.
        corr = corrcoef(spikes(:,2*iteration -1), spikes(:,2*iteration));
        %Store correlation in stereotypy matrix.
        stereotypy(iteration) = corr(1,2);
    end
end
