function [KC_indPREDstereotypy] = kc_indpred(kca,kcb)
%   where kca is the matrix of 2000 KCs response for 100 different odors of
%   individual A
%   and kcb, individual B.

%This function returns the PRED stereotypy between the two individuals' individual KCs for all 2000
%of them.

KC_indPREDstereotypy=zeros(2000,1);
for i=1:2000
    
    a=nnz(kca(i,:));
    b=nnz(kcb(i,:));
    
    if(a~=0 && b~=0)
        data=stereotypy(kca(i,:)',kcb(i,:)');
        KC_indPREDstereotypy(i,1)=nanmean(data);          
    end
    
end

end

