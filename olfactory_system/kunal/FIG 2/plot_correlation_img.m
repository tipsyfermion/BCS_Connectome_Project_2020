
function plot_correlation_img(spikes_1,spikes_2,heading)
%PLOT_CORRELATION_IMG Plots a colour graph depicting the correlation of the neruon responses.
    
    %Remove the empty dimentions
    spikes_1 = squeeze(spikes_1);
    spikes_2 = squeeze(spikes_2);
    
    %Get no. of neurons
    [~,neurons] = size(spikes_1);
    
    %Initialize empty variable
    corr_matrix = NaN(neurons);
    
    %Run loop to calculate correlation
    for i = 1:neurons
        for j = 1:neurons
            corr_temp = corrcoef(spikes_1(:,i),spikes_2(:,j));
            corr_matrix(i,j) = corr_temp(1,2);
        end
    end
    
    %Remove NaNs
    corr_matrix = corr_matrix(~isnan(corr_matrix(:,1)),~isnan(corr_matrix(1,:)));
    
    %Plot the result.
    pcolor(corr_matrix);
    
    %Formatting
    xlabel('Individual A');
    ylabel('Individual B');
    title(strcat('Correlation colour plot for',string(heading)));
    colorbar();
    caxis([-1,1]);
    
end