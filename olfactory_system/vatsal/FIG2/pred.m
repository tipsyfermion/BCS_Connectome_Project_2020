function pred_stereotypy = pred(output)
    % generate empty matrix to store pred stereotypy
    % 4950 = all possible combinations pairs of 100 odors
    % 100 for 100 iterations
    pred_stereotypy=nan(4950,100);
    for iteration = 1:100
        
        % [counter] to keep count of 4950 odor_pairs
        counter=0;
        
        % [odor1] first odor of the pair of odors
        % [odor2] second odor of the pair of odors
        for odor1 = 1:99
            for odor2 = (odor1+1):100
                
                % D1 calculation
                d1=output([odor1,odor2],[iteration,iteration+100]);
                D1=sum((d1(:,1)-d1(:,2)).^2);
                
                % D2 calculation
                d2=[d1(:,1),flip(d1(:,2))];
                D2=sum((d2(:,1)-d2(:,2)).^2);
                counter=counter+1;
                
                % calculation of pred
                pred_stereotypy(counter,iteration)=(D2-D1)/(D2+D1);
            end
        end
    end
end