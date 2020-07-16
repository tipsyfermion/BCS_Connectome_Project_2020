function stereotypy = get_PRED_stereotypy(spikes)
%GET_PRED_STEREOTYPY Returns the PRED based sterotypy for spike data.

    %INITIALIZATION
    %Get no of odors and no of individuals.
    [no_odor, no_indi] = size(spikes);
    %Get no of pairs of individuals.
    iterations = no_indi/2;
    %Get all possible pairs of combinations of odors for PRED.
    odor_combos = nchoosek(1:no_odor, 2);
    %Get no of combinations.
    [no_of_pairs,~] = size(odor_combos);
    %Generate empty variable to contain values.
    stereotypy = nan(no_of_pairs,iterations);
    
    
    %MAIN LOOP
    %Run sterotypy iterations and 
    for iteration = 1:iterations
        for odor_pair = 1:no_of_pairs
            
            %Extract data from individual and odor pair.
            data1 = spikes(odor_combos(odor_pair,:), [2*iteration - 1, 2*iteration]);
            %Calculate D1
            D1 = sum(diff(data1,1,2).^2);
            %Swap rows in one column.
            data2 = [data1(:,1),flip(data1(:,2))];
            %Calculate D2
            D2 = sum(diff(data2,1,2).^2);
            %Calculate PRED
            temp_sterotypy = (D2-D1)/(D1+D2);
            %Store the PRED value in a variable.
            stereotypy(odor_pair,iteration) = temp_sterotypy;
        end
        
    end    
    
end
